with

source as (

    select * from {{ source('ecom', 'orders') }}

),

renamed as (

    select
        id as order_id,
        store_id as location_id,
        customer as customer_id,

        {{convert_cents_to_euro('subtotal')}} as subtotal_cents,
        {{convert_cents_to_euro('tax_paid')}} as tax_paid_cents,
        {{convert_cents_to_euro('order_total')}}  as order_total_cents

    from source

)

select * from renamed