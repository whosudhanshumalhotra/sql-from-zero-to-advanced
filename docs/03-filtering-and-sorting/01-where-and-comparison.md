# WHERE and Comparison Operators

`WHERE` filters individual input rows before grouping and aggregation.

```sql
SELECT product_name, unit_price
FROM learning.products
WHERE unit_price >= 3000;
```

## Comparison operators

| Operator | Meaning |
|---|---|
| `=` | Equal |
| `<>` or `!=` | Not equal |
| `>` / `>=` | Greater than / at least |
| `<` / `<=` | Less than / at most |

Use the operator that expresses the business rule. For example, "at least 18" means `>= 18`, not `> 18`.

## Combining predicates

```sql
SELECT product_name, category, unit_price
FROM learning.products
WHERE is_active = TRUE
  AND category = 'Accessories'
  AND unit_price < 5000;
```

`AND` requires every condition to be TRUE. `OR` requires at least one condition to be TRUE. Use parentheses when mixing them:

```sql
WHERE (category = 'Accessories' OR category = 'Displays')
  AND is_active = TRUE;
```

Without parentheses, operator precedence can change the meaning.

## NULL and three-valued logic

A predicate can be TRUE, FALSE, or UNKNOWN. WHERE retains only TRUE rows.

```sql
SELECT employee_id
FROM learning.employees
WHERE manager_id = NULL; -- Incorrect: evaluates UNKNOWN

SELECT employee_id
FROM learning.employees
WHERE manager_id IS NULL; -- Correct
```

## Sargability and performance

A predicate is often easier for a normal index to support when the indexed column is compared directly to a compatible value:

```sql
WHERE hire_date >= DATE '2024-01-01'
```

A function wrapped around the column may prevent use of a simple index:

```sql
WHERE EXTRACT(YEAR FROM hire_date) = 2024
```

A matching expression index can sometimes help, but first consider rewriting the predicate as a range. Always inspect a real plan before claiming an optimization.

## Exercises

1. Find products priced from 2,000 through 5,000 inclusive.
2. Find employees hired before 2023 and earning more than 80,000.
3. Find customers whose city is NULL.
4. Write a mixed AND/OR predicate with explicit parentheses.
5. Explain how NULL affects `NOT (city = 'Delhi')`.
