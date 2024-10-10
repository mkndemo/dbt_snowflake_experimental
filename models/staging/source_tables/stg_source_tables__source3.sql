{{ config( materialized='view' ) }}

with 

source as (

    select * from {{ source('source_tables', 'source3') }}

),

renamed as (

    select
        CAST(pk as INTEGER) as pk,
        column_2,
        column_4,
        updated_at
    from source

)

select * from renamed
