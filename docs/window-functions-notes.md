# SQL Window Functions: Practical Reference

Window functions calculate values across related rows without collapsing the result into one row per group.

## Common patterns

### Rank employees or products within a group

```sql
SELECT
    department,
    employee_name,
    salary,
    DENSE_RANK() OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS salary_rank
FROM employees;
```

### Compare current month with previous month

```sql
SELECT
    month_start,
    revenue,
    LAG(revenue) OVER (ORDER BY month_start) AS previous_month_revenue
FROM monthly_revenue;
```

### Calculate a running total

```sql
SELECT
    order_date,
    order_id,
    amount,
    SUM(amount) OVER (
        ORDER BY order_date, order_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_revenue
FROM orders;
```

## Practical cautions

- Use `PARTITION BY` to restart calculations for each group.
- Use a deterministic tie-breaker when ranking or calculating running totals.
- `ROW_NUMBER`, `RANK`, and `DENSE_RANK` treat ties differently.
- `LAG` returns NULL when no previous row exists unless a default is supplied.
- Test date grain and duplicate rows before calculating month-over-month change.
- The examples are templates; replace table and column names with the actual schema and run them before relying on results.