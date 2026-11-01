# SQL Business Sales Analysis | MySQL

A practical SQL project for answering business questions using an e-commerce sales dataset.

## Business objective

Transform transaction data into repeatable summaries of revenue, profit, orders, product performance, customer contribution, and monthly trends.

## Business questions

- What are total net revenue, profit, and distinct orders?
- Which products and categories contribute most?
- Which customers have the highest recorded revenue?
- How does revenue change month over month?
- Which categories have lower profitability?

## Tools and SQL concepts

MySQL · MySQL Workbench · SQL

- Filtering, sorting, and aggregation
- `GROUP BY`, `HAVING`, and `CASE WHEN`
- Subqueries and CTEs
- Ranking and window functions
- `LAG()` for period-over-period comparisons

## Repository structure

- `sql/` — database setup and analysis scripts.
- `sql/10_monthly_performance.sql` — monthly revenue, profit, order counts, and category margin examples.
- Check the repository data files for the dataset and expected schema.

## How to run

1. Open MySQL Workbench or another MySQL client.
2. Run the database setup script, if provided.
3. Confirm the database and table names used by each script.
4. Check column names and data types against the source dataset.
5. Execute the SQL files and inspect the result sets.

## Metric definitions

Use the same revenue definition consistently across queries. Distinct order count should use the order identifier, not the number of line-item rows. Calculate margin from aggregated profit and revenue, not by averaging row-level percentages.

## Results and limitations

The SQL scripts must be run against the current project schema before publishing numerical findings. Document exclusions such as cancelled orders, discounts, and returns when applicable.

## Skills demonstrated

MySQL · Business KPI reporting · CTEs · Window functions · Customer and product analysis · Monthly trend analysis

Maintained by [Omkar S. Kshirsagar](https://github.com/osk25-xc).
