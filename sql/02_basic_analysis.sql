USE ecommerce_sales;

-- Total Orders
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM sales;

-- Total Units Sold
SELECT SUM(quantity) AS total_units_sold
FROM sales;

-- Total Revenue
SELECT ROUND(
    SUM(quantity * unit_price * (1 - discount)), 2
) AS total_revenue
FROM sales;

-- Total Profit
SELECT ROUND(SUM(profit), 2) AS total_profit
FROM sales;

-- Average Order Value
SELECT ROUND(
    SUM(quantity * unit_price * (1 - discount))
    / COUNT(DISTINCT order_id),
    2
) AS average_order_value
FROM sales;