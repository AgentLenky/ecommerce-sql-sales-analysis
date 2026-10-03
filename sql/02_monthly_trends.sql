-- Section 2: Monthly Sales Dynamics
-- Revenue, profit and order volume by month across the full period.

SELECT 
    SUBSTR("Order Date", 1, 7) AS year_month,
    ROUND(SUM(Sales)) AS sales,
    ROUND(SUM(Profit)) AS profit,
    COUNT(*) AS orders
FROM Ecommerce_Sales_Data
GROUP BY SUBSTR("Order Date", 1, 7)
ORDER BY year_month;
