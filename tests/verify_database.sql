-- Smoke tests for the seeded learning database. Run with psql -v ON_ERROR_STOP=1.
SET search_path TO learning, public;

DO $$
DECLARE
    actual_count BIGINT;
BEGIN
    SELECT COUNT(*) INTO actual_count FROM departments;
    IF actual_count <> 4 THEN
        RAISE EXCEPTION 'Expected 4 departments, found %', actual_count;
    END IF;

    SELECT COUNT(*) INTO actual_count FROM employees;
    IF actual_count <> 6 THEN
        RAISE EXCEPTION 'Expected 6 employees, found %', actual_count;
    END IF;

    SELECT COUNT(*) INTO actual_count FROM customers;
    IF actual_count <> 5 THEN
        RAISE EXCEPTION 'Expected 5 customers, found %', actual_count;
    END IF;

    SELECT COUNT(*) INTO actual_count FROM products;
    IF actual_count <> 6 THEN
        RAISE EXCEPTION 'Expected 6 products, found %', actual_count;
    END IF;

    SELECT COUNT(*) INTO actual_count FROM orders;
    IF actual_count <> 5 THEN
        RAISE EXCEPTION 'Expected 5 orders, found %', actual_count;
    END IF;

    SELECT COUNT(*) INTO actual_count FROM order_items;
    IF actual_count <> 5 THEN
        RAISE EXCEPTION 'Expected 5 order items, found %', actual_count;
    END IF;

    SELECT COUNT(*) INTO actual_count FROM payments;
    IF actual_count <> 5 THEN
        RAISE EXCEPTION 'Expected 5 payments, found %', actual_count;
    END IF;

    IF EXISTS (
        SELECT 1
        FROM order_items oi
        LEFT JOIN orders o ON o.order_id = oi.order_id
        LEFT JOIN products p ON p.product_id = oi.product_id
        WHERE o.order_id IS NULL OR p.product_id IS NULL
    ) THEN
        RAISE EXCEPTION 'Found an order item with a broken reference';
    END IF;

    IF EXISTS (SELECT 1 FROM products WHERE unit_price < 0 OR stock_quantity < 0) THEN
        RAISE EXCEPTION 'Found invalid product price or stock';
    END IF;
END $$;

SELECT 'All SQL learning database smoke tests passed.' AS test_result;
