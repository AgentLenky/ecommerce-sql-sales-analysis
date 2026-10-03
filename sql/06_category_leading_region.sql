-- Section 6: Category's Leading Region
-- Pairs each category's overall totals (same numbers as 03_category_breakdown.sql)
-- with the single region where that category sells the most.
-- Note: figures are category-level totals, not recalculated per region -
-- the region column only identifies where each category performs best.
-- Requires SQLite 3.25+ (window functions).

WITH category_totals AS (
    SELECT 
        Category,
        ROUND(SUM(Sales)) AS total_revenue,
        ROUND(SUM(Profit)) AS total_profit,
        COUNT("Order ID") AS total_orders,
        COUNT(DISTINCT "Customer Name") AS total_customers,
        ROUND(AVG(Sales)) AS avg_order_value,
        ROUND(AVG(Profit / Sales * 100)) AS avg_margin_pct
    FROM Ecommerce_Sales_Data
    GROUP BY Category
),
category_region_rank AS (
    SELECT 
        Category,
        Region,
        SUM(Sales) AS region_sales,
        ROW_NUMBER() OVER (PARTITION BY Category ORDER BY SUM(Sales) DESC) AS rn
    FROM Ecommerce_Sales_Data
    GROUP BY Category, Region
)
SELECT 
    ct.Category,
    crr.Region AS leading_region,
    ct.total_revenue,
    ct.total_profit,
    ct.total_orders,
    ct.total_customers,
    ct.avg_order_value,
    ct.avg_margin_pct
FROM category_totals ct
JOIN category_region_rank crr 
    ON ct.Category = crr.Category AND crr.rn = 1
ORDER BY ct.total_profit DESC;
