-- models/marts/final_customers.sql
with db1 as (
    select * from {{ ref('stg_customers__db1') }}
),
db2 as (
    select * from {{ ref('stg_customers__db2') }}
),
merged as (
    select
        coalesce(db1.customer_id, db2.customer_id) as customer_id,
        coalesce(db1.first_name, db2.first_name) as first_name,
        coalesce(db1.last_name, db2.last_name) as last_name,
        coalesce(db1.updated_at, db2.updated_at) as updated_at
    from db1
    full outer join db2 on db1.customer_id = db2.customer_id
)

select * from merged order by customer_id
