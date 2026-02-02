WITH monthly_metrics AS (
    SELECT
        StockCode,
        month,
        SUM(Quantity) AS units_sold,
        SUM(revenue) AS revenue
    FROM marketplace_orders
    GROUP BY StockCode, month
),
lagged AS (
    SELECT
        StockCode,
        month,
        units_sold,
        revenue,
        LAG(units_sold) OVER (PARTITION BY StockCode ORDER BY month) AS prev_units,
        LAG(revenue) OVER (PARTITION BY StockCode ORDER BY month) AS prev_revenue
    FROM monthly_metrics
)
SELECT
    StockCode,
    month,
    units_sold,
    revenue,
    ROUND((units_sold - prev_units) * 1.0 / prev_units, 2) AS unit_change_pct,
    ROUND((revenue - prev_revenue) * 1.0 / prev_revenue, 2) AS revenue_change_pct
FROM lagged
WHERE prev_units IS NOT NULL
  AND (units_sold < prev_units * 0.7 OR revenue < prev_revenue * 0.7)
ORDER BY revenue_change_pct;
