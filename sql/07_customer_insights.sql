USE ecommerce_sales;

-- Customer Insights

-- 1. Total spending by customer
SELECT
    customer_name,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(sales) AS total_spending,
    SUM(profit) AS total_profit
FROM sales
GROUP BY customer_name
ORDER BY total_spending DESC;

-- 2. Top 5 customers by profit
SELECT
    customer_name,
    SUM(profit) AS total_profit
FROM sales
GROUP BY customer_name
ORDER BY total_profit DESC
LIMIT 5;

-- 3. Average order value by customer
SELECT
    customer_name,
    AVG(sales) AS average_order_value
FROM sales
GROUP BY customer_name
ORDER BY average_order_value DESC;