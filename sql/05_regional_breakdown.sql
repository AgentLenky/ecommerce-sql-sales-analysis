-- Section 5: Regional Breakdown

SELECT 
    Region,
    ROUND(SUM(Sales)) AS total_revenue,
    ROUND(SUM(Profit)) AS total_profit,
    COUNT("Order ID") AS total_orders,
    COUNT(DISTINCT "Customer Name") AS total_customers,
    ROUND(AVG(Sales)) AS avg_order_value,
    ROUND(AVG(Profit / Sales * 100)) AS avg_margin_pct
FROM Ecommerce_Sales_Data
GROUP BY Region
ORDER BY total_revenue DESC;
