# SQL Analysis Review Checklist

## Correctness
- Confirm database dialect and table/column names.
- Check join keys and expected join cardinality before aggregation.
- Prevent fan-out when joining order headers to line items.
- Use `COUNT(DISTINCT order_id)` when the fact grain is order line.
- Handle NULLs and divide-by-zero explicitly.

## KPI consistency
Define treatment of cancelled orders, refunds, discounts, and taxes. Calculate margin from aggregate profit and revenue. For month-over-month growth, use a calendar table if missing months must appear.

## Performance and readability
Use clear aliases, consistent indentation, and CTEs for multi-step logic. Filter early when it preserves semantics. Avoid `SELECT *` in final reporting queries.

## Reproducibility
Record the database engine/version and expected schema. Run each script from a clean session and compare totals with an independent calculation.
