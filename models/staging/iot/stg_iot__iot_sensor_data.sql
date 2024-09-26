{{
    config(
        materialized='incremental',
        unique_key='unique_id',
        on_schema_change='sync_all_columns'
    )
}}

with source as (
    select * from {{ source('iot', 'iot_sensor_data') }}
    {% if is_incremental() %}
        where unique_id not in (select unique_id from {{ this }}) 
    {% endif %}
),

renamed as (

    select
        *,
        CURRENT_TIMESTAMP() updated_at,
         '{{ invocation_id }}' as batch_id
    from source
)

select * from renamed
