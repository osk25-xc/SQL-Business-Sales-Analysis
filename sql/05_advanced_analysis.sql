USE ecommerce_sales;

-- Product Performance
SELECT
    product_name,
    ROUND(SUM(profit), 2) AS total_profit,
    CASE
        WHEN SUM(profit) >= 30000 THEN 'High Performance'
        WHEN SUM(profit) >= 10000 THEN 'Medium Performance'
        ELSE 'Low Performance'
    END AS performance
FROM sales
GROUP BY product_name
ORDER BY total_profit DESC;


-- Product Ranking
SELECT
    product_name,
    ROUND(SUM(profit), 2) AS profit,
    RANK() OVER (
        ORDER BY SUM(profit) DESC
    ) AS profit_rank
FROM sales
GROUP BY product_name;


-- Region Ranking
SELECT
    region,
    ROUND(SUM(profit), 2) AS profit,
    RANK() OVER (
        ORDER BY SUM(profit) DESC
    ) AS region_rank
FROM sales
GROUP BY region;


-- Monthly Revenue
WITH monthly_sales AS (
    SELECT
        MONTH(order_date) AS month,
        SUM(
            quantity * unit_price * (1 - discount)
        ) AS revenue
    FROM sales
    GROUP BY MONTH(order_date)
)

SELECT
    month,
    ROUND(revenue, 2) AS revenue
FROM monthly_sales
ORDER BY month;


-- Month-over-Month Growth
WITH monthly_sales AS (
    SELECT
        MONTH(order_date) AS month,
        SUM(
            quantity * unit_price * (1 - discount)
        ) AS revenue
    FROM sales
    GROUP BY MONTH(order_date)
)

SELECT
    month,
    ROUND(revenue, 2) AS revenue,
    ROUND(
        revenue - LAG(revenue) OVER (ORDER BY month),
        2
    ) AS revenue_change
FROM monthly_sales
ORDER BY month;