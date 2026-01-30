-- SKU level deep dive (revenue, orders, customer reach)
WITH sku_perf AS (
  SELECT
    StockCode AS sku,
    COALESCE(Description, 'Unknown') AS sku_name,
    Country,
    COUNT(DISTINCT InvoiceNo) AS orders,
    COUNT(DISTINCT CustomerID) AS customers,
    ROUND(SUM(revenue), 2) AS revenue,
    ROUND(AVG(UnitPrice), 2) AS avg_unit_price,
    ROUND(AVG(Quantity), 2) AS avg_units_per_order
  FROM marketplace_orders
  WHERE revenue IS NOT NULL
  GROUP BY StockCode, Description, Country
)
SELECT *
FROM sku_perf
ORDER BY revenue DESC
LIMIT 200;
