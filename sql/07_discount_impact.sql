-- Section 7: Discount Impact Analysis

SELECT 
    Discount,
    COUNT(*) AS orders,
    ROUND(SUM(Sales)) AS total_sales,
    ROUND(AVG(Sales)) AS avg_check,
    ROUND(SUM(Profit)) AS total_profit,
    ROUND(AVG(Profit / Sales * 100), 1) AS avg_margin_pct
FROM Ecommerce_Sales_Data
GROUP BY Discount
ORDER BY Discount;
