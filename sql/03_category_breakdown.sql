-- Section 3: Revenue, Profit, Orders and Margin by Category

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
ORDER BY Category;
