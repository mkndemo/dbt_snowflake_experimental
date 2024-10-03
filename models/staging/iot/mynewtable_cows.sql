select 
count(*) as counter, cow_id
 from {{ ref('stg_iot__iot_sensor_data') }}
 group by 2