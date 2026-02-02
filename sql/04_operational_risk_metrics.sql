-- 04_operational_risk_metrics.sql (FINAL)
-- Goal: Always produce Low/Medium/High operational risk using return/cancel proxies.
-- Uses NTILE(3) to bucket SKUs by return_rate_proxy (relative risk), so you won’t get only Low Risk.

WITH base AS (
  SELECT
    InvoiceNo,
    StockCode AS sku,
    Quantity,
    revenue
  FROM marketplace_orders
  WHERE StockCode IS NOT NULL
),
returns AS (
  SELECT
    sku,
    COUNT(*) AS return_rows
  FROM base
  WHERE Quantity < 0
     OR revenue < 0
     OR InvoiceNo LIKE 'C%'
  GROUP BY sku
),
sales AS (
  SELECT
    sku,
    COUNT(*) AS total_rows
  FROM base
  GROUP BY sku
),
rates AS (
  SELECT
    s.sku,
    s.total_rows,
    COALESCE(r.return_rows, 0) AS return_rows,
    (CAST(COALESCE(r.return_rows, 0) AS REAL) / NULLIF(s.total_rows, 0)) AS return_rate_proxy
  FROM sales s
  LEFT JOIN returns r
    ON s.sku = r.sku
),
bucketed AS (
  -- Bucket only "meaningful" SKUs to avoid tiny SKUs dominating risk buckets
  SELECT
    *,
    NTILE(3) OVER (ORDER BY return_rate_proxy) AS risk_bucket
  FROM rates
  WHERE total_rows >= 5
)
SELECT
  r.sku,
  r.total_rows,
  r.return_rows,

  -- base rate (0..1)
  ROUND(r.return_rate_proxy, 6) AS return_rate_proxy,

  -- scaled versions for better scatter readability (avoid straight-line near 0)
  ROUND(r.return_rate_proxy * 100.0, 4)   AS return_rate_pct,
  ROUND(r.return_rate_proxy * 10000.0, 2) AS return_rate_bps,
  ROUND(r.return_rate_proxy * 1000.0, 2)  AS return_rate_per_1000,

  CASE
    WHEN r.total_rows < 5 THEN 'Low Risk'          -- keep tiny SKUs low risk
    WHEN b.risk_bucket = 3 THEN 'High Risk'
    WHEN b.risk_bucket = 2 THEN 'Medium Risk'
    ELSE 'Low Risk'
  END AS risk_flag

FROM rates r
LEFT JOIN bucketed b
  ON r.sku = b.sku
ORDER BY r.return_rate_proxy DESC;
