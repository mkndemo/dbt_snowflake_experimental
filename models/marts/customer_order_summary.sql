-- models/customer_order_summary.sql
WITH customer_orders AS (
    SELECT
        c.customer_id,
        c.name,
        COUNT(o.order_id) AS total_orders,
        SUM(o.ORDER_TOTAL) AS total_amount_spent
    FROM {{ ref('dim_customers') }} c
    LEFT JOIN {{ ref('fct_orders') }} o
    ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.name
)

SELECT *
FROM customer_orders
