USE ecommerce_sales;

-- ============================================
-- BUSINESS INSIGHTS ANALYSIS
-- ============================================

-- 1. Category-wise Revenue and Profit
SELECT
    category,
    SUM(sales) AS total_revenue,
    SUM(profit) AS total_profit
FROM sales
GROUP BY category
ORDER BY total_profit DESC;


-- 2. Top 10 Most Profitable Products
SELECT
    product_name,
    SUM(profit) AS total_profit
FROM sales
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 10;


-- 3. Top 10 Customers by Revenue
SELECT
    customer_name,
    SUM(sales) AS total_revenue
FROM sales
GROUP BY customer_name
ORDER BY total_revenue DESC
LIMIT 10;


-- 4. Region-wise Sales Performance
SELECT
    region,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM sales
GROUP BY region
ORDER BY total_sales DESC;


-- 5. Monthly Sales Trend
SELECT
    MONTH(order_date) AS month,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM sales
GROUP BY MONTH(order_date)
ORDER BY month;


-- 6. Products with High Sales but Low Profit
SELECT
    product_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM sales
GROUP BY product_name
HAVING SUM(sales) > 5000
   AND SUM(profit) < 1000
ORDER BY total_sales DESC;


-- 7. Overall Business Performance
SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(sales) AS total_revenue,
    SUM(profit) AS total_profit,
    AVG(sales) AS average_order_value
FROM sales;