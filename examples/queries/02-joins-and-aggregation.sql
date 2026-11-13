SET search_path TO learning, public;

-- Employees with their department names.
SELECT e.first_name, e.last_name, d.department_name
FROM employees AS e
JOIN departments AS d ON d.department_id = e.department_id
ORDER BY d.department_name, e.last_name;

-- Order totals. LEFT JOIN preserves orders with no items.
SELECT o.order_id,
       c.full_name,
       COALESCE(SUM(oi.quantity * oi.unit_price_at_purchase), 0) AS order_total
FROM orders AS o
JOIN customers AS c ON c.customer_id = o.customer_id
LEFT JOIN order_items AS oi ON oi.order_id = o.order_id
GROUP BY o.order_id, c.full_name
ORDER BY o.order_id;
