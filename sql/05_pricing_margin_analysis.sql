-- Pricing signal: average selling price by SKU and revenue concentration

SELECT
  stock_code AS sku,
  SUM(quantity) AS units_sold,
  ROUND(SUM(revenue), 2) AS revenue,
  ROUND(SUM(revenue) / NULLIF(SUM(quantity),0), 2) AS avg_selling_price
FROM online_retail_cleaned
GROUP BY stock_code
HAVING SUM(quantity) >= 50
ORDER BY revenue DESC
LIMIT 50;
