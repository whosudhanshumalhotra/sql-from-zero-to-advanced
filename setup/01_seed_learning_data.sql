-- Deterministic seed data for lessons and exercises.
SET search_path TO learning, public;

INSERT INTO departments (department_name, location) VALUES
('Engineering', 'Bengaluru'),
('Data', 'Hyderabad'),
('Human Resources', 'Delhi'),
('Finance', 'Mumbai')
ON CONFLICT (department_name) DO NOTHING;

INSERT INTO employees
(first_name, last_name, email, department_id, manager_id, salary, hire_date, employment_status)
SELECT v.first_name, v.last_name, v.email, d.department_id, NULL,
       v.salary, v.hire_date::date, 'ACTIVE'
FROM (VALUES
 ('Aarav','Sharma','aarav@example.test','Engineering',120000,'2021-02-10'),
 ('Diya','Mehta','diya@example.test','Engineering',95000,'2022-05-15'),
 ('Kabir','Verma','kabir@example.test','Data',110000,'2020-08-01'),
 ('Anaya','Singh','anaya@example.test','Data',90000,'2023-01-12'),
 ('Ishaan','Gupta','ishaan@example.test','Human Resources',75000,'2022-11-20'),
 ('Sara','Khan','sara@example.test','Finance',88000,'2021-09-05')
) AS v(first_name,last_name,email,department_name,salary,hire_date)
JOIN departments d ON d.department_name = v.department_name
ON CONFLICT (email) DO NOTHING;

INSERT INTO customers (full_name, email, city) VALUES
('Rohan Malhotra','rohan@example.test','Delhi'),
('Meera Iyer','meera@example.test','Bengaluru'),
('Arjun Rao','arjun@example.test','Hyderabad'),
('Tara Kapoor','tara@example.test','Mumbai'),
('Neil Das','neil@example.test','Delhi')
ON CONFLICT (email) DO NOTHING;

INSERT INTO products (product_name, category, unit_price, stock_quantity) VALUES
('Mechanical Keyboard','Accessories',4500,35),
('Wireless Mouse','Accessories',1800,80),
('Laptop Pro 14','Computers',125000,12),
('USB-C Hub','Accessories',3200,25),
('Monitor 27','Displays',22000,18),
('Laptop Stand','Accessories',2100,40)
ON CONFLICT (product_name) DO NOTHING;

INSERT INTO orders (customer_id, order_date, status)
SELECT c.customer_id, v.order_date::timestamptz, v.status
FROM (VALUES
 ('rohan@example.test','2025-01-05 10:00:00+05:30','PAID'),
 ('meera@example.test','2025-01-06 12:30:00+05:30','SHIPPED'),
 ('arjun@example.test','2025-01-08 15:45:00+05:30','PLACED'),
 ('rohan@example.test','2025-02-02 09:15:00+05:30','PAID'),
 ('tara@example.test','2025-02-10 17:20:00+05:30','CANCELLED')
) AS v(email,order_date,status)
JOIN customers c ON c.email = v.email
WHERE NOT EXISTS (
    SELECT 1 FROM orders o
    WHERE o.customer_id = c.customer_id
      AND o.order_date = v.order_date::timestamptz
);

INSERT INTO order_items (order_id, product_id, quantity, unit_price_at_purchase)
SELECT o.order_id, p.product_id, v.quantity, v.price
FROM (VALUES
 ('rohan@example.test','2025-01-05 10:00:00+05:30','Mechanical Keyboard',1,4500::numeric),
 ('rohan@example.test','2025-01-05 10:00:00+05:30','Wireless Mouse',2,1800::numeric),
 ('meera@example.test','2025-01-06 12:30:00+05:30','Laptop Pro 14',1,125000::numeric),
 ('arjun@example.test','2025-01-08 15:45:00+05:30','USB-C Hub',1,3200::numeric),
 ('rohan@example.test','2025-02-02 09:15:00+05:30','Monitor 27',1,22000::numeric)
) AS v(email,order_date,product_name,quantity,price)
JOIN customers c ON c.email = v.email
JOIN orders o ON o.customer_id = c.customer_id
             AND o.order_date = v.order_date::timestamptz
JOIN products p ON p.product_name = v.product_name
ON CONFLICT (order_id, product_id) DO NOTHING;

INSERT INTO payments (order_id, amount, payment_status, paid_at)
SELECT o.order_id,
       CASE WHEN o.status IN ('PAID','SHIPPED')
            THEN COALESCE(SUM(oi.quantity * oi.unit_price_at_purchase),0)
            ELSE 0 END,
       CASE WHEN o.status IN ('PAID','SHIPPED') THEN 'SUCCESS' ELSE 'PENDING' END,
       CASE WHEN o.status IN ('PAID','SHIPPED') THEN o.order_date ELSE NULL END
FROM orders o
LEFT JOIN order_items oi ON oi.order_id = o.order_id
GROUP BY o.order_id, o.status, o.order_date
ON CONFLICT (order_id) DO NOTHING;
