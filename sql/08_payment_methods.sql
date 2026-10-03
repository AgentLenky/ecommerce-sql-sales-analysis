-- Section 8: Payment Methods Analysis

SELECT 
    "Payment Mode",
    COUNT(*) AS orders,
    ROUND(SUM(Sales)) AS total_sales,
    ROUND(AVG(Sales)) AS avg_check,
    ROUND(SUM(Profit)) AS total_profit,
    ROUND(AVG(Profit / Sales * 100), 1) AS avg_margin_pct
FROM Ecommerce_Sales_Data
GROUP BY "Payment Mode"
ORDER BY total_sales DESC;
