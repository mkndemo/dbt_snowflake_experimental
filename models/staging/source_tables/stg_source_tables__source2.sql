{{ config( materialized='view' ) }}

with 

source as (

    select * from {{ source('source_tables', 'source2') }}

),

renamed as (

    select
        CAST(pk as INTEGER) as pk,
        column_3,
        updated_at
    from source

)

select * from renamed