SET search_path TO learning, public;

-- Demonstration only: use a disposable database.
BEGIN;
UPDATE products
SET stock_quantity = stock_quantity - 1
WHERE product_id = 1 AND stock_quantity >= 1;

-- Inspect the affected row before deciding to commit.
SELECT product_id, product_name, stock_quantity
FROM products
WHERE product_id = 1;

ROLLBACK; -- This example intentionally undoes the change.
