SELECT * FROM {{ ref('fct_orders') }} 
WHERE FIRST_ORDER_DATE is null