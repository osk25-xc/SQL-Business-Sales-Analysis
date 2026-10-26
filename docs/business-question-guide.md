# SQL Business Analysis Workflow

Use this guide to turn sales data into clear, verifiable business answers.

## Suggested questions

1. What are total revenue, order count, and average order value?
2. Which products and categories contribute the most revenue?
3. How does revenue change month over month?
4. Which customers contribute the most revenue, and how concentrated is revenue among them?
5. Which regions or segments are below target, if targets are available?

## Query checklist

- Confirm the table grain before aggregating (order, order line, or payment).
- Avoid double-counting orders after joining order headers to line items.
- Use explicit date boundaries and document inclusivity.
- Handle NULL values and zero denominators deliberately.
- Use `COUNT(DISTINCT order_id)` when measuring unique orders across line items.
- Validate totals against a simple baseline query.
- Include a short business interpretation beside each result.

## Metric definitions

- **Revenue:** sum of the agreed sales amount; state whether discounts, refunds, and tax are included.
- **Orders:** distinct order identifiers in the reporting scope.
- **Average order value:** revenue divided by distinct orders, when the denominator is non-zero.
- **Month-over-month change:** `(current month - previous month) / previous month`; report N/A when the prior month is zero.

Do not publish sample results as business facts until the query has been run against the intended dataset.