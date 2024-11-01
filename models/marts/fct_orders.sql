--  1. GET ALL CUSTOMERS
with customers as (
    select * from {{ ref("stg_ecom__customers") }}
),

-- 2. GET ALL ORDERS
orders as (
    select * from {{ ref("stg_ecom__orders") }}
),

-- 3. Do some metric calculation or aggregation here
customer_orders as (
    select 
        customer_id, 
        min(ordered_at) as first_order_date
    from orders
    group by 1
),

-- 4. Do joins here on customer_id, make sure to get the first_order date
final as (
    select 
        customers.customer_id,
        customers.full_name,
        customer_orders.first_order_date
    from customers
    left join customer_orders using (customer_id)
)

select * from final