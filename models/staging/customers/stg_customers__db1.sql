with 

source as (

    select * from {{ source('customers', 'db1') }}

),

renamed as (

    select
        id as customer_id,
        first_name,
        last_name,
        updated_at

    from source

)

select * from renamed
