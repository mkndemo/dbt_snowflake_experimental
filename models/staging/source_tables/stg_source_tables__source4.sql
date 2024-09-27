{{ config( materialized='view' ) }}

with 

source as (

    select * from {{ source('source_tables', 'source4') }}

),

renamed as (

    select
        CAST(pk as INTEGER) as pk,
        column_5,
        column_200,
        updated_at

    from source

)

select * from renamed