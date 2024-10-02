-- models/fct_sick_cows.sql
with sick_cows as (
   select
       iot.cow_id,
       iot.customer_id,
       cust.customer_name,
       cust.customer_farm_location,
       cust.customer_contact_email,
       iot.cow_temperature,
       iot.cow_activity_level,
       iot.cow_health_status
   from {{ ref('stg_iot__iot_sensor_data') }} iot
   join {{ ref('stg_siebel__customers') }} cust
       on iot.customer_id = cust.customer_id
   where iot.cow_health_status = 'Sick'
)

select * from sick_cows
