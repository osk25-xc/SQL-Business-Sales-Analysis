# SQL Analyst Practice Lab

Use these prompts against your own schema. Check column names and table grain first; these are practice prompts, not verified outputs for a specific database.

## Beginner

1. Return total revenue and number of unique orders.
2. List the five products with the highest revenue.
3. Find orders in a chosen date range.
4. Find rows with missing customer identifiers.

## Intermediate

5. Calculate monthly revenue and order count.
6. Find customers whose revenue is above the average customer revenue.
7. Compare revenue by region and category.
8. Identify products with no sales in the selected period, if a product master table exists.

## Advanced

9. Rank products by revenue within each category using `DENSE_RANK()`.
10. Calculate month-over-month revenue change using `LAG()`.
11. Calculate a running revenue total ordered by date and order ID.
12. Find customers who purchased in one month but not the next, defining the cohort window explicitly.

## Review checklist

- Does the result have the intended grain?
- Could joins multiply rows and inflate sums?
- Are dates inclusive/exclusive as intended?
- Are NULL values handled deliberately?
- Are ties treated correctly for rankings?
- Have totals been reconciled with a simple baseline query?

## Suggested submission format

For each query, write the business question, SQL, a small result excerpt, and one sentence explaining what the result means. Never report a result until the query has actually been executed.