-- Section 1: Key Metrics
-- Overall KPIs across the full analyzed period (Oct 2023 - Oct 2025).

SELECT 
    ROUND(SUM(Sales)) AS total_revenue,
    ROUND(SUM(Profit)) AS total_profit,
    COUNT("Order ID") AS total_orders,
    COUNT(DISTINCT "Customer Name") AS total_customers,
    ROUND(AVG(Sales)) AS avg_order_value,
    ROUND(AVG(Profit / Sales * 100)) AS avg_margin_pct
FROM Ecommerce_Sales_Data;
