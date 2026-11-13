# LEFT, RIGHT, and FULL OUTER JOIN

## LEFT JOIN

A LEFT JOIN keeps every row from the left input. If no right-side row matches, right-side columns are filled with NULL.

```sql
SELECT c.customer_id, c.full_name, o.order_id
FROM learning.customers AS c
LEFT JOIN learning.orders AS o
  ON o.customer_id = c.customer_id
ORDER BY c.customer_id, o.order_id;
```

This is useful when the question is "show every customer, including those with no orders."

## Find rows without a match

```sql
SELECT c.customer_id, c.full_name
FROM learning.customers AS c
LEFT JOIN learning.orders AS o
  ON o.customer_id = c.customer_id
WHERE o.order_id IS NULL;
```

`NOT EXISTS` is another clear way to express an anti-join:

```sql
SELECT c.customer_id, c.full_name
FROM learning.customers AS c
WHERE NOT EXISTS (
    SELECT 1
    FROM learning.orders AS o
    WHERE o.customer_id = c.customer_id
);
```

## A subtle WHERE mistake

This query removes customers with no orders:

```sql
SELECT c.full_name, o.status
FROM learning.customers AS c
LEFT JOIN learning.orders AS o
  ON o.customer_id = c.customer_id
WHERE o.status = 'PAID';
```

The WHERE predicate rejects the NULL-extended rows. If the goal is to retain every customer but only match paid orders, put the condition in ON:

```sql
SELECT c.full_name, o.status
FROM learning.customers AS c
LEFT JOIN learning.orders AS o
  ON o.customer_id = c.customer_id
 AND o.status = 'PAID';
```

## RIGHT and FULL OUTER JOIN

RIGHT JOIN preserves all right-side rows; many teams prefer reversing table order and writing LEFT JOIN for consistency.

FULL OUTER JOIN preserves unmatched rows from both sides. It is useful for reconciliation, such as comparing two systems' records.

## Exercises

1. Find customers with no orders using both LEFT JOIN and NOT EXISTS.
2. Keep all products while showing matching order items.
3. Explain the difference between a predicate in ON and the same predicate in WHERE for a LEFT JOIN.
