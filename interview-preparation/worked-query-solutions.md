# SQL Interview Query Patterns — Worked Solutions

All examples use the `learning` schema and PostgreSQL.

## 1. Second-highest distinct salary

```sql
SELECT DISTINCT salary
FROM learning.employees
ORDER BY salary DESC
OFFSET 1
LIMIT 1;
```

This returns the second-highest distinct salary overall. For the second-highest salary **per department**, use DENSE_RANK partitioned by department.

## 2. Second-highest salary per department, including ties

```sql
WITH ranked AS (
  SELECT department_id, employee_id, first_name, salary,
         DENSE_RANK() OVER (
           PARTITION BY department_id ORDER BY salary DESC
         ) AS salary_rank
  FROM learning.employees
)
SELECT department_id, employee_id, first_name, salary
FROM ranked
WHERE salary_rank = 2;
```

## 3. Find duplicate email values

```sql
SELECT email, COUNT(*) AS occurrences
FROM some_table
GROUP BY email
HAVING COUNT(*) > 1;
```

A UNIQUE constraint should normally prevent duplicates going forward. Cleanup needs a deterministic rule for which record to retain and must account for foreign-key references.

## 4. Customers with no orders

```sql
SELECT c.customer_id, c.full_name
FROM learning.customers AS c
WHERE NOT EXISTS (
  SELECT 1
  FROM learning.orders AS o
  WHERE o.customer_id = c.customer_id
);
```

## 5. Top three products by revenue within category

```sql
WITH product_revenue AS (
  SELECT p.category, p.product_id, p.product_name,
         SUM(oi.quantity * oi.unit_price_at_purchase) AS revenue
  FROM learning.products AS p
  JOIN learning.order_items AS oi ON oi.product_id = p.product_id
  JOIN learning.orders AS o ON o.order_id = oi.order_id
  WHERE o.status IN ('PAID', 'SHIPPED')
  GROUP BY p.category, p.product_id, p.product_name
),
ranked AS (
  SELECT *,
         DENSE_RANK() OVER (
           PARTITION BY category ORDER BY revenue DESC
         ) AS revenue_rank
  FROM product_revenue
)
SELECT category, product_name, revenue
FROM ranked
WHERE revenue_rank <= 3
ORDER BY category, revenue DESC, product_name;
```

## 6. Running daily revenue

```sql
WITH daily AS (
  SELECT o.order_date::date AS order_day,
         SUM(oi.quantity * oi.unit_price_at_purchase) AS revenue
  FROM learning.orders AS o
  JOIN learning.order_items AS oi ON oi.order_id = o.order_id
  WHERE o.status IN ('PAID', 'SHIPPED')
  GROUP BY o.order_date::date
)
SELECT order_day, revenue,
       SUM(revenue) OVER (
         ORDER BY order_day
         ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS running_revenue
FROM daily
ORDER BY order_day;
```

## 7. Important interview habit

Clarify whether "top 3" means exactly three rows or the top three distinct values including ties. Clarify how NULLs, cancelled orders, refunds, duplicate events, and time zones should be treated before writing a production metric.
