SET search_path TO learning, public;

SELECT department_id, first_name, last_name, salary,
       DENSE_RANK() OVER (
           PARTITION BY department_id
           ORDER BY salary DESC
       ) AS salary_rank_in_department
FROM employees
ORDER BY department_id, salary_rank_in_department, employee_id;
