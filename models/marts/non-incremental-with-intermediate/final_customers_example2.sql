-- models/marts/final_customers.sql
with ranked_customers as (

    select
        *,
        row_number() over (
            partition by customer_id
            order by source_priority
        ) as rn
    from {{ ref('int_customers_union') }}

)

select
    customer_id,
    first_name,
    last_name,
    updated_at
from ranked_customers
where rn = 1  -- Select the record with the highest priority
