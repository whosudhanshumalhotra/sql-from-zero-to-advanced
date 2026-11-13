# INNER JOIN

A join combines rows from relations using a matching condition. An INNER JOIN returns only row combinations for which the join condition is TRUE.

## Example

```sql
SELECT
    e.employee_id,
    e.first_name,
    d.department_name
FROM learning.employees AS e
INNER JOIN learning.departments AS d
    ON d.department_id = e.department_id
ORDER BY e.employee_id;
```

The foreign-key relationship connects an employee's department ID to the department primary key.

## Why aliases matter

Aliases shorten names and make multi-table queries easier to read. Qualify a column when both tables contain a column with the same name:

```sql
SELECT c.customer_id, c.full_name, o.order_id, o.order_date
FROM learning.customers AS c
JOIN learning.orders AS o
  ON o.customer_id = c.customer_id;
```

## Join cardinality

- One-to-one: each row matches at most one row on the other side.
- One-to-many: one parent can match many child rows.
- Many-to-many: rows are connected through a junction table.

If one customer has five orders, joining customers to orders produces five rows for that customer. That is not duplication by itself; it is the relationship's cardinality.

## The classic aggregation trap

Suppose an order has three items and two payments (if the model permits multiple payments). Joining both child tables before aggregating can produce 3 × 2 = 6 rows. Summing item totals after this join double-counts them.

Aggregate each child relation to the intended grain first, then join the summaries.

## Exercises

1. List each employee with their department.
2. List each order with its customer name.
3. Count orders per customer.
4. Explain why a one-to-many join increases row count.
5. Construct an example where joining two child tables causes double counting.
