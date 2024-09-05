with source as (
    select * from {{ source('iot', 'iot_sensor_data') }}
),

renamed as (

    select
        customer_id,
        cow_id,
        temperature as cow_temperature,
        activity_level as cow_activity_level,
        health_status as cow_health_status

    from source

)

select * from renamed
