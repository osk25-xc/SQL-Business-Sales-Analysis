USE ecommerce_sales;

-- Top Customers
SELECT
    customer_id,
    customer_name,
    ROUND(
        SUM(quantity * unit_price * (1 - discount)), 2
    ) AS total_spent
FROM sales
GROUP BY customer_id, customer_name
ORDER BY total_spent DESC
LIMIT 10;

-- Customer Order Count
SELECT
    customer_id,
    customer_name,
    COUNT(order_id) AS total_orders
FROM sales
GROUP BY customer_id, customer_name
ORDER BY total_orders DESC;

-- Revenue by Region
SELECT
    region,
    ROUND(
        SUM(quantity * unit_price * (1 - discount)), 2
    ) AS revenue
FROM sales
GROUP BY region
ORDER BY revenue DESC;

-- Profit by Region
SELECT
    region,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales
GROUP BY region
ORDER BY total_profit DESC;