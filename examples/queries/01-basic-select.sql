SET search_path TO learning, public;

-- Explicit projection: choose only the columns needed.
SELECT employee_id, first_name, last_name, salary
FROM employees
ORDER BY employee_id;

-- Filtering and sorting.
SELECT product_name, unit_price
FROM products
WHERE is_active = TRUE AND unit_price >= 3000
ORDER BY unit_price DESC;
