with

source as (

    select * from {{ source('jaffle_shop', 'customers') }} --raw

),

renamed as (

    select

        ----------  ids
        id as customer_id,
        'max knutsson' as fullname,

        ---------- properties
        name

    from source

)

select * from renamed