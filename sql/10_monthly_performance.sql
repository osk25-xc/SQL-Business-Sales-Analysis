USE ecommerce_sales;

-- Monthly sales, profit, and order count.
-- Revenue follows the same discounted-sales definition used in 02_basic_analysis.sql.
WITH monthly AS (
    SELECT
        DATE_FORMAT(order_date, '%Y-%m') AS sales_month,
        SUM(quantity * unit_price * (1 - discount)) AS revenue,
        SUM(profit) AS total_profit,
        COUNT(DISTINCT order_id) AS total_orders
    FROM sales
    GROUP BY DATE_FORMAT(order_date, '%Y-%m')
),
monthly_with_previous AS (
    SELECT
        sales_month,
        revenue,
        total_profit,
        total_orders,
        LAG(revenue) OVER (ORDER BY sales_month) AS previous_month_revenue
    FROM monthly
)
SELECT
    sales_month,
    ROUND(revenue, 2) AS revenue,
    ROUND(total_profit, 2) AS total_profit,
    total_orders,
    ROUND(
        100 * (revenue - previous_month_revenue)
        / NULLIF(previous_month_revenue, 0),
        2
    ) AS revenue_growth_pct
FROM monthly_with_previous
ORDER BY sales_month;

-- Profit margin by category.
-- Aggregate profit and discounted revenue before calculating the ratio.
SELECT
    category,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(quantity * unit_price * (1 - discount)),
        2
    ) AS net_revenue,
    ROUND(
        100 * SUM(profit)
        / NULLIF(SUM(quantity * unit_price * (1 - discount)), 0),
        2
    ) AS profit_margin_pct
FROM sales
GROUP BY category
ORDER BY total_profit DESC;
