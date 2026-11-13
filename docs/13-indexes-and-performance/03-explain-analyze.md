# EXPLAIN and EXPLAIN ANALYZE

A query plan describes how PostgreSQL intends to retrieve or modify data.

## EXPLAIN

```sql
EXPLAIN
SELECT product_name
FROM learning.products
WHERE category = 'Accessories';
```

This shows the estimated plan without executing the query.

## EXPLAIN ANALYZE

```sql
EXPLAIN (ANALYZE, BUFFERS)
SELECT product_name
FROM learning.products
WHERE category = 'Accessories';
```

This executes the statement and reports actual timing and row counts alongside estimates. `ANALYZE` on a data-changing statement really performs the change; use a transaction and rollback when experimenting.

## What to inspect

- **Scan type:** sequential, index, index-only, bitmap.
- **Estimated rows vs actual rows:** large differences can indicate stale statistics or estimation challenges.
- **Loops:** a node executed many times may dominate total work.
- **Buffers:** shared hits and reads help understand cache and I/O activity.
- **Sort/hash nodes:** inspect memory use and whether operations spill to disk.
- **Planning vs execution time:** distinguish planning overhead from execution work.

## A sequential scan is not automatically bad

For a small table or a query returning a large fraction of rows, reading the table sequentially may be cheaper than following an index and fetching many scattered heap pages.

## A disciplined tuning workflow

1. Capture the exact SQL and representative parameters.
2. Measure baseline latency and workload context.
3. Run EXPLAIN ANALYZE in a safe environment.
4. Find the expensive node and understand why it is expensive.
5. Change one thing at a time.
6. Compare plans and timings on representative data.
7. Consider write overhead, storage, and maintenance cost.
8. Re-test under realistic concurrency.

Never create indexes just because a column appears in a WHERE clause. Selectivity, table size, column order, query shape, and workload all matter.
