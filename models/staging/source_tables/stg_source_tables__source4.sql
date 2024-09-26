{{ config( materialized='view' ) }}

with 

source as (

    select * from {{ source('source_tables', 'source4') }}

),

renamed as (

    select
        pk,
        column_5,
        column_200

    from source

)

select * from renamed
