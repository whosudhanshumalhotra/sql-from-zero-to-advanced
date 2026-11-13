SET search_path TO learning, public;

WITH order_totals AS (
    SELECT o.order_id, o.customer_id,
           SUM(oi.quantity * oi.unit_price_at_purchase) AS total_amount
    FROM orders AS o
    JOIN order_items AS oi ON oi.order_id = o.order_id
    GROUP BY o.order_id, o.customer_id
)
SELECT c.full_name, ot.order_id, ot.total_amount
FROM order_totals AS ot
JOIN customers AS c ON c.customer_id = ot.customer_id
WHERE ot.total_amount > 5000
ORDER BY ot.total_amount DESC;
