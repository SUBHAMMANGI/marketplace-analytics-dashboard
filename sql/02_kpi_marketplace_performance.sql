-- Marketplace Performance KPIs (sales, conversion proxy, traffic proxy)
-- Note: Online Retail dataset does not contain sessions/traffic; we use proxy metrics:
-- traffic_proxy = unique customers
-- conversion_proxy = orders per customer

WITH base AS (
  SELECT
    DATE(order_date) AS order_day,
    month,
    Country,
    StockCode AS sku,
    revenue,
    InvoiceNo AS order_id,
    CustomerID AS customer_id
  FROM marketplace_orders
  WHERE revenue IS NOT NULL
)
SELECT
  order_day,
  month,
  Country,
  COUNT(DISTINCT order_id) AS orders,
  COUNT(DISTINCT customer_id) AS traffic_proxy_unique_customers,
  ROUND(CAST(COUNT(DISTINCT order_id) AS FLOAT) / NULLIF(COUNT(DISTINCT customer_id), 0), 3) AS conversion_proxy_orders_per_customer,
  ROUND(SUM(revenue), 2) AS gross_revenue,
  ROUND(AVG(revenue), 2) AS avg_order_value
FROM base
GROUP BY order_day, month, Country
ORDER BY order_day;
