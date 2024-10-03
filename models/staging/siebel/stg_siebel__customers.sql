with source as (
    select * from {{ source('siebel', 'customers') }}
),

renamed as (

    select
        customer_id,
        customer_name,
        farm_location as customer_farm_location,
        contact_email as customer_contact_email,
        subscription_level as [level]

    from source

)

select * from renamed
