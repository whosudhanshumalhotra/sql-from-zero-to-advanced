# ROW_NUMBER, RANK, and DENSE_RANK

Ranking window functions assign numbers to rows within an ordered window.

## Example: rank employees by salary per department

```sql
SELECT
    department_id,
    employee_id,
    first_name,
    salary,
    ROW_NUMBER() OVER (
        PARTITION BY department_id
        ORDER BY salary DESC, employee_id
    ) AS row_num,
    RANK() OVER (
        PARTITION BY department_id
        ORDER BY salary DESC
    ) AS salary_rank,
    DENSE_RANK() OVER (
        PARTITION BY department_id
        ORDER BY salary DESC
    ) AS dense_salary_rank
FROM learning.employees
ORDER BY department_id, salary DESC, employee_id;
```

## Difference

For ordered values `100, 100, 90`:

| Value | ROW_NUMBER | RANK | DENSE_RANK |
|---:|---:|---:|---:|
| 100 | 1 | 1 | 1 |
| 100 | 2 | 1 | 1 |
| 90 | 3 | 3 | 2 |

- `ROW_NUMBER` gives every row a unique sequential number. Add a deterministic tie-breaker if the selected row must be stable.
- `RANK` gives ties the same rank and leaves gaps.
- `DENSE_RANK` gives ties the same rank without gaps.

## Top N per group

```sql
WITH ranked AS (
    SELECT
        e.*,
        DENSE_RANK() OVER (
            PARTITION BY department_id
            ORDER BY salary DESC
        ) AS salary_rank
    FROM learning.employees AS e
)
SELECT employee_id, first_name, department_id, salary
FROM ranked
WHERE salary_rank <= 3
ORDER BY department_id, salary DESC, employee_id;
```

This returns the top three distinct salary ranks per department, potentially more than three people when ties exist. If the requirement is exactly up to three rows per department, use ROW_NUMBER with a deterministic tie-breaker.

## Exercises

1. Return the second-highest distinct salary in each department.
2. Return exactly the top two employees per department.
3. Return everyone tied for the highest salary in each department.
4. Explain why filtering a window result usually requires an outer query or CTE.
