with 

source as (

    select * from {{ source('jaffle_shop', 'raw_customers') }}

),

renamed as (

    select
        c1,
        c2

    from source

)

select * from renamed
