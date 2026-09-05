USE ecommerce_sales;

-- Profit Analysis

-- 1. Overall profit margin
SELECT
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin_percent
FROM sales;

-- 2. Category-wise profit margin
SELECT
    category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin_percent
FROM sales
GROUP BY category
ORDER BY profit_margin_percent DESC;

-- 3. Loss-making products
SELECT
    product_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM sales
GROUP BY product_name
HAVING SUM(profit) < 0
ORDER BY total_profit ASC;