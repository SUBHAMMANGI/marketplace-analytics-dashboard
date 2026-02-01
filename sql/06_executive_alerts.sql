-- Flag SKUs with abnormal revenue or volume drops (executive alert logic)

WITH monthly_metrics AS (
  SELECT
    sku,
    month,
    SUM(quantity) AS units_sold,
    SUM(revenue) AS revenue
  FROM online_retail_cleaned
  GROUP BY sku, month
),
lagged AS (
  SELECT
    sku,
    month,
    units_sold,
    revenue,
    LAG(units_sold) OVER (PARTITION BY sku ORDER BY month) AS prev_units,
    LAG(revenue) OVER (PARTITION BY sku ORDER BY month) AS prev_revenue
  FROM monthly_metrics
)
SELECT
  sku,
  month,
  units_sold,
  revenue,
  ROUND((units_sold - prev_units) * 1.0 / prev_units, 2) AS unit_change_pct,
  ROUND((revenue - prev_revenue) * 1.0 / prev_revenue, 2) AS revenue_change_pct
FROM lagged
WHERE prev_units IS NOT NULL
  AND (units_sold < prev_units * 0.7 OR revenue < prev_revenue * 0.7)
ORDER BY revenue_change_pct;
