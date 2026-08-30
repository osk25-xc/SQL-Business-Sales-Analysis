USE ecommerce_sales;

-- Sales by Product
SELECT
    product_name,
    SUM(quantity) AS units_sold,
    ROUND(
        SUM(quantity * unit_price * (1 - discount)), 2
    ) AS revenue
FROM sales
GROUP BY product_name
ORDER BY revenue DESC;

-- Top 10 Products
SELECT
    product_name,
    ROUND(
        SUM(quantity * unit_price * (1 - discount)), 2
    ) AS revenue
FROM sales
GROUP BY product_name
ORDER BY revenue DESC
LIMIT 10;

-- Profit by Product
SELECT
    product_name,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales
GROUP BY product_name
ORDER BY total_profit DESC;

-- Sales by Category
SELECT
    category,
    ROUND(
        SUM(quantity * unit_price * (1 - discount)), 2
    ) AS revenue
FROM sales
GROUP BY category
ORDER BY revenue DESC;