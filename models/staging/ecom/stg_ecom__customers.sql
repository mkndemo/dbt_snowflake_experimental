with 

source as (

    select * from {{ source('ecom', 'customers') }}

),

renamed as (

    select
        id,
        name

    from source

)

select * from renamed
