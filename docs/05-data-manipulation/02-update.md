# UPDATE and Safe Change Practices

`UPDATE` changes values in existing rows.

## Basic syntax

```sql
UPDATE learning.products
SET unit_price = 4700
WHERE product_id = 1;
```

The WHERE clause identifies target rows. Without it, every row in the table is eligible for update.

## Preview before changing

A safe habit is to run the predicate as a SELECT first:

```sql
SELECT product_id, product_name, unit_price
FROM learning.products
WHERE category = 'Accessories'
  AND unit_price < 2000;
```

Only after confirming the target set should you issue the UPDATE.

## Update from an expression

```sql
UPDATE learning.products
SET unit_price = ROUND(unit_price * 1.05, 2)
WHERE category = 'Accessories'
RETURNING product_id, product_name, unit_price;
```

PostgreSQL's `RETURNING` lets you inspect changed rows without a second query.

## Transaction for a risky change

```sql
BEGIN;

UPDATE learning.products
SET stock_quantity = stock_quantity - 1
WHERE product_id = 1
  AND stock_quantity >= 1
RETURNING product_id, stock_quantity;

-- Check that the returned row count and values are correct.
ROLLBACK; -- Use COMMIT only after validation.
```

In application code, check the affected-row count. A zero-row result may mean the record does not exist or a precondition failed.

## UPDATE ... FROM caution

PostgreSQL supports `UPDATE ... FROM`. Ensure the source relation produces at most one matching row per target row; otherwise the chosen source row can be unpredictable.

## Exercises

1. Increase all active product prices by 3%.
2. Set a customer's city only when it is currently NULL.
3. Write an update that changes exactly one employee by primary key.
4. Explain why a transaction does not automatically make an incorrect WHERE clause safe.
