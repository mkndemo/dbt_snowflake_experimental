{{
    config(
        materialized='incremental',
        unique_key='unique_id',
        on_schema_change='sync_all_columns'
    )
}}

with source as (
    select * from {{ source('iot', 'iot_sensor_data') }}
),

renamed as (

    select
        unique_id,
        event_time,
        cow_id,
        customer_id,
        temperature as cow_temperature_c,
        temperature as cow_temperature_f,
        activity_level as cow_activity_level,
        health_status as cow_health_status,

        CURRENT_TIMESTAMP() updated_at,
        '{{ invocation_id }}' as batch_id
    from source
)

select * from renamed
