
with

source as (

    select * from {{ source('jaffle_shop', 'products') }}
),

renamed as (

    select

        ----------  ids
        sku as product_id,

        ---------- properties
        name as product_name,
        type as product_type,
        description as product_description,
        {{ cents_to_dollars('price') }} as product_price,


        ---------- derived
        CASE
            WHEN regexp_like(lower(description), '.*(oat|oatmilk).*') THEN true
            ELSE false
        END AS is_oat_based,
        case
            when type = 'jaffle' then 1
            else 0
        end as is_food_item,

        case
            when type = 'beverage' then 1
            else 0
        end as is_drink_item

    from source

)

select * from renamed