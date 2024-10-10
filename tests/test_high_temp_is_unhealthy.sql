-- tests/temperature_health_check.sql

WITH health_data AS (
    SELECT
        cow_id,
        cow_temperature,
        cow_health_status
    FROM {{ ref('stg_iot__iot_sensor_data') }}
)

SELECT *
FROM health_data
WHERE cow_temperature > 41
AND cow_health_status != 'Unhealthy'