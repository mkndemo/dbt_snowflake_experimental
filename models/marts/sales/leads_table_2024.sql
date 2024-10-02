-- models/marts/lead_generation.sql

{{ config(
    materialized='incremental',
    unique_key='unique_id',
    on_schema_change='sync_all_columns'
) }}

WITH sensor_data AS (
    SELECT 
        *
    FROM {{ ref('stg_iot__iot_sensor_data') }}
    WHERE cow_health_status = 'Unhealthy' -- Filter unhealthy cows
),

customer_data AS (
    SELECT 
        *
    FROM {{ ref('stg_siebel__customers') }}
),

lead_candidates AS (
    SELECT 
        sensor_data.cow_id,
        sensor_data.customer_id,
        customer_data.customer_name,
        customer_data.customer_contact_email,
        customer_data.subscription_level,
        sensor_data.cow_temperature,
        sensor_data.cow_health_status,
        CURRENT_TIMESTAMP() AS lead_generated_at
    FROM sensor_data
    JOIN customer_data 
        ON sensor_data.customer_id = customer_data.customer_id
    WHERE customer_data.subscription_level != 'Premium' -- Offer only to non-premium customers
)

SELECT * FROM lead_candidates

--temp what it is docs
--can i do quick check, tests
