# SQL Practice Problems

The practice ladder is designed to build fluency, not memorization. Solve each problem using the shared `learning` schema unless the prompt provides a separate schema.

## Difficulty guide

- **Easy:** one table, basic projection, filtering, sorting.
- **Medium:** aggregation, joins, subqueries, NULL handling.
- **Hard:** multi-step business logic, CTEs, window functions.
- **Expert:** correctness under edge cases, transactions, query plans, performance trade-offs.

## Starter problems

### Easy
1. Return every active product with its name and price.
2. Find employees hired after `2022-01-01`.
3. List customers from Delhi.
4. Return the five most expensive products.
5. Find employees whose salary is between 80,000 and 120,000.

### Medium
6. Count employees in each department, including departments with zero employees.
7. Calculate each order's total value.
8. Find customers who have never placed an order.
9. Find products that have never been ordered.
10. Return departments whose average salary is above 90,000.

### Hard
11. Find the highest-paid employee in each department, including ties.
12. Return each customer's most recent order.
13. Rank products by revenue within category.
14. Calculate a running total of daily order revenue.
15. Find customers whose spending is above the average customer spending.

### Expert
16. Explain how you would prevent overselling inventory when two checkouts compete for the last item.
17. Design a query for monthly repeat-purchase rate and define its denominator.
18. Diagnose a slow join-and-aggregation query using `EXPLAIN (ANALYZE, BUFFERS)`.
19. Explain why an index may not be selected by the planner.
20. Write a safe transaction that changes inventory and records an order atomically.

## Submission template

For every problem, record:
- Problem statement
- Assumptions
- SQL solution
- Expected result
- Edge cases tested
- Complexity/performance considerations
- Alternative solution (if meaningful)
