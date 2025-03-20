SELECT
    c.customer_state AS state,
    ROUND(SUM(p.payment_value), 2) AS total_revenue
FROM
    olist_orders o
INNER JOIN
    olist_order_payments p ON o.order_id = p.order_id
INNER JOIN
    olist_customers c ON o.customer_id = c.customer_id
WHERE
    o.order_status = 'delivered'
    AND o.order_delivered_customer_date IS NOT NULL
GROUP BY
    c.customer_state
ORDER BY
    total_revenue DESC;

-- TODO: This query will return a table with two columns; customer_state, and
-- Revenue. The first one will have the letters that identify the top 10 states 
-- with most revenue and the second one the total revenue of each.
-- HINT: All orders should have a delivered status and the actual delivery date 
-- should be not null. 
