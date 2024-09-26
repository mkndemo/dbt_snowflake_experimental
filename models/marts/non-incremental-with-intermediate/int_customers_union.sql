-- models/final_customers.sql
{{
    config(
        materialized='view'
    )
}}

with combined as (

    select *, 1 as source_priority from {{ ref('stg_customers__db1') }}
    union all
    select *, 2 as source_priority from {{ ref('stg_customers__db2') }}
    -- Add more sources as needed

)

select
    *
from combined