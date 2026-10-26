USE ecommerce_sales;

-- E-commerce Customer & Revenue Deep Dive
-- Schema: sales(order_id, order_date, customer_id, customer_name,
-- product_name, category, region, quantity, unit_price, discount, profit)
-- Assumption: discount is stored as a decimal fraction (e.g., 0.10 = 10%),
-- matching the existing project revenue formula.

-- 1. Monthly revenue and month-over-month change
WITH monthly_revenue AS (
    SELECT
        DATE_FORMAT(order_date, '%Y-%m') AS sales_month,
        ROUND(SUM(quantity * unit_price * (1 - COALESCE(discount, 0))), 2) AS revenue
    FROM sales
    GROUP BY DATE_FORMAT(order_date, '%Y-%m')
),
monthly_comparison AS (
    SELECT
        sales_month,
        revenue,
        LAG(revenue) OVER (ORDER BY sales_month) AS previous_month_revenue
    FROM monthly_revenue
)
SELECT
    sales_month,
    revenue,
    previous_month_revenue,
    ROUND(revenue - previous_month_revenue, 2) AS revenue_change,
    ROUND(
        100 * (revenue - previous_month_revenue)
        / NULLIF(previous_month_revenue, 0),
        2
    ) AS revenue_change_pct
FROM monthly_comparison
ORDER BY sales_month;

-- 2. Customer revenue ranking
SELECT
    customer_id,
    customer_name,
    COUNT(DISTINCT order_id) AS order_count,
    ROUND(SUM(quantity * unit_price * (1 - COALESCE(discount, 0))), 2) AS customer_revenue,
    ROUND(AVG(quantity * unit_price * (1 - COALESCE(discount, 0))), 2) AS avg_line_value
FROM sales
GROUP BY customer_id, customer_name
ORDER BY customer_revenue DESC
LIMIT 10;

-- 3. Category revenue, profit, and profit margin
SELECT
    category,
    ROUND(SUM(quantity * unit_price * (1 - COALESCE(discount, 0))), 2) AS revenue,
    ROUND(SUM(profit), 2) AS profit,
    ROUND(
        100 * SUM(profit)
        / NULLIF(SUM(quantity * unit_price * (1 - COALESCE(discount, 0))), 0),
        2
    ) AS profit_margin_pct
FROM sales
GROUP BY category
ORDER BY revenue DESC;

-- 4. Repeat-customer summary
WITH customer_orders AS (
    SELECT customer_id, COUNT(DISTINCT order_id) AS order_count
    FROM sales
    GROUP BY customer_id
)
SELECT
    CASE WHEN order_count >= 2 THEN 'Repeat customer' ELSE 'One-time customer' END AS customer_type,
    COUNT(*) AS customers
FROM customer_orders
GROUP BY CASE WHEN order_count >= 2 THEN 'Repeat customer' ELSE 'One-time customer' END;

-- 5. Data quality checks: missing keys, invalid quantities/prices, duplicate order IDs
SELECT
    SUM(order_id IS NULL) AS missing_order_ids,
    SUM(order_date IS NULL) AS missing_order_dates,
    SUM(customer_id IS NULL) AS missing_customer_ids,
    SUM(quantity IS NULL OR quantity <= 0) AS invalid_quantities,
    SUM(unit_price IS NULL OR unit_price < 0) AS invalid_unit_prices
FROM sales;

SELECT order_id, COUNT(*) AS row_count
FROM sales
GROUP BY order_id
HAVING COUNT(*) > 1;
