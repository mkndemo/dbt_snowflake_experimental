{{ config( materialized='view' ) }}

with 

source as (

    select * from {{ source('source_tables', 'source2') }}

),

renamed as (

    select
        pk,
        column_3
    from source

)

select * from renamed
