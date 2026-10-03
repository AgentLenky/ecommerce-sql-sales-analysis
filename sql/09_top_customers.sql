-- Section 9: Top-10 Customers by Revenue

SELECT 
    "Customer Name",
    COUNT("Order ID") AS total_orders,
    ROUND(SUM(Sales)) AS total_revenue,
    ROUND(AVG(Sales)) AS avg_check,
    ROUND(SUM(Profit)) AS total_profit,
    ROUND(AVG(Profit / Sales * 100), 1) AS avg_margin_pct
FROM Ecommerce_Sales_Data
GROUP BY "Customer Name"
ORDER BY total_revenue DESC
LIMIT 10;
