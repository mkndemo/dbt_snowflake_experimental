select
    cow_id as id,
    customer_id as customer
from {{ source('iot', 'iot_sensor_data') }}
