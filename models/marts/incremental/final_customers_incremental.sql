{{ config(materialized='incremental', unique_key='customer_id') }}

with combined as (

    select
        customer_id,
        first_name,
        last_name,
        updated_at,
        1 as source_priority
    from {{ ref('stg_customers__db2') }}

    union all

    select
        customer_id,
        first_name,
        last_name,
        updated_at,
        2 as source_priority
    from {{ ref('stg_customers__db1') }}

),

ranked as (

    select
        *,
        row_number() over (
            partition by customer_id
            order by source_priority, updated_at desc
        ) as rn
    from combined

),

filtered as (

    {% if is_incremental() %}
        -- Only consider records that are new or have been updated since the last run
        select * from ranked
        where updated_at >= (select coalesce(max(updated_at), '1900-01-01') from {{ this }})
    {% else %}
        -- For full refresh, use all records
        select * from ranked
    {% endif %}

)

select
    customer_id,
    first_name,
    last_name,
    updated_at
from filtered
where rn = 1
