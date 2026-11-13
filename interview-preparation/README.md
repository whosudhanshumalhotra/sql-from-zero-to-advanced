# SQL Interview Preparation

Prepare to write queries, explain database concepts, debug incorrect results, and reason about performance.

## Core questions

1. What is SQL? How is it different from PostgreSQL?
2. What is the difference between DBMS and RDBMS?
3. What are primary and foreign keys?
4. What is the difference between WHERE and HAVING?
5. What is the difference between DELETE, TRUNCATE, and DROP?
6. What is NULL? Why does `column = NULL` not work?
7. What is the difference between INNER JOIN and LEFT JOIN?
8. What is normalization? Explain 1NF, 2NF, and 3NF.
9. What is an index? What are its costs?
10. What are ACID properties?

## Intermediate questions

11. UNION vs UNION ALL?
12. IN vs EXISTS?
13. What is a correlated subquery?
14. CTE vs subquery?
15. ROW_NUMBER vs RANK vs DENSE_RANK?
16. How do you find the second-highest salary, including ties?
17. How do you find duplicate records?
18. How do you find customers with no orders?
19. What is a composite index and why does column order matter?
20. What is the difference between a view and a materialized view?

## Advanced questions

21. Explain MVCC in PostgreSQL.
22. Explain transaction isolation and anomalies.
23. What is a deadlock and how can it be reduced?
24. How does PostgreSQL use a B-tree index?
25. How do you read an EXPLAIN ANALYZE plan?
26. Why can a sequential scan be faster than an index scan?
27. What is a covering/index-only scan?
28. How do you prevent SQL injection?
29. How would you safely implement inventory reservation?
30. How would you design a high-write order database?

## Query challenges

- Second-highest salary per department.
- Top three products by monthly revenue.
- Customers with consecutive monthly purchases.
- Running balance per bank account.
- Seven-day rolling average of revenue.
- Detect duplicate emails and safely clean them.
- Find gaps in a sequence of dates.
- Calculate customer retention by signup cohort.

## How to answer well

Use this structure:
1. Define the concept accurately.
2. Explain why it matters.
3. Give a small example.
4. Mention a trade-off or edge case.
5. Connect it to a real production scenario.

Do not claim a query is faster without evidence. Use representative data and inspect the query plan.
