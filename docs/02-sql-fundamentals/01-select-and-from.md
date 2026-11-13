# SELECT and FROM

## Mental model

A table is a set of rows described by columns. `SELECT` chooses the output expressions; `FROM` identifies the source relation.

```sql
SET search_path TO learning, public;

SELECT first_name, last_name, salary
FROM employees;
```

The query returns three columns for qualifying employee rows. It does not modify the table.

## Projection and expressions

```sql
SELECT
    first_name,
    last_name,
    salary,
    salary * 12 AS annual_salary
FROM employees;
```

An expression can calculate a value for each row. `AS annual_salary` names the output column; it does not create a stored column.

## SELECT *

```sql
SELECT * FROM employees;
```

Useful for quick exploration, but avoid it in stable application queries because:
- It transfers columns the caller may not need.
- A new column can unexpectedly change the result shape.
- It obscures the data contract.
- It can expose fields that should not be returned.

Prefer explicit columns.

## DISTINCT

```sql
SELECT DISTINCT department_id
FROM employees;
```

`DISTINCT` removes duplicate output rows. It is not a substitute for understanding why a join produced duplicates. Multiple selected columns are considered together.

## NULL

NULL represents missing or unknown information; it is not zero, an empty string, or a normal value.

```sql
SELECT employee_id
FROM employees
WHERE manager_id IS NULL;
```

Use `IS NULL`, not `= NULL`. Comparisons involving NULL generally produce UNKNOWN under SQL's three-valued logic.

PostgreSQL-specific null-safe comparison:

```sql
SELECT NULL IS DISTINCT FROM NULL; -- false
SELECT NULL IS DISTINCT FROM 5;    -- true
```

## Logical processing order

A useful conceptual order is:

`FROM` → `WHERE` → `GROUP BY` → `HAVING` → `SELECT` → `DISTINCT` → `ORDER BY` → `LIMIT`

This is a logical model, not a promise about the physical execution order. The optimizer may transform the query while preserving its meaning.

## Exercises

1. Return employee first and last names with a single full-name expression.
2. Return unique department IDs.
3. Find employees without a manager.
4. Explain why `SELECT DISTINCT` can hide a faulty join.
5. Return each product's price including a calculated 10% tax column.
