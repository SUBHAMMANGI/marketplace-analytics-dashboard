-- Operational metrics & risk flags (SLA style proxies)
-- Online Retail doesn't have delivery/cancellation/defects, so we create operational quality proxies:
-- cancellation_proxy = negative quantity or negative revenue invoices
-- defect_proxy = unusually high return rate per SKU

WITH base AS (
  SELECT
    InvoiceNo,
    StockCode AS sku,
    CustomerID,
    DATE(order_date) AS order_day,
    Quantity,
    revenue
  FROM marketplace_orders
),
returns AS (
  SELECT
    sku,
    COUNT(*) AS return_rows
  FROM base
  WHERE Quantity < 0 OR revenue < 0
  GROUP BY sku
),
sales AS (
  SELECT
    sku,
    COUNT(*) AS total_rows
  FROM base
  GROUP BY sku
)
SELECT
  s.sku,
  s.total_rows,
  COALESCE(r.return_rows, 0) AS return_rows,
  ROUND(CAST(COALESCE(r.return_rows, 0) AS FLOAT) / NULLIF(s.total_rows, 0), 4) AS return_rate_proxy,
  CASE
    WHEN CAST(COALESCE(r.return_rows, 0) AS FLOAT) / NULLIF(s.total_rows, 0) >= 0.10 THEN 'High Risk'
    WHEN CAST(COALESCE(r.return_rows, 0) AS FLOAT) / NULLIF(s.total_rows, 0) >= 0.05 THEN 'Medium Risk'
    ELSE 'Low Risk'
  END AS risk_flag
FROM sales s
LEFT JOIN returns r ON s.sku = r.sku
ORDER BY return_rate_proxy DESC;
