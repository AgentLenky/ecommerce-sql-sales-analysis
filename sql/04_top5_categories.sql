-- Section 4: Top-5 Categories by Revenue and Profit
-- Same aggregation as 03_category_breakdown.sql, ranked by profit.

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
ORDER BY total_profit DESC
LIMIT 5;
