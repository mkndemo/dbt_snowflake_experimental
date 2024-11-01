{{
    config(
        materialized='table'
    )
}}


SELECT id as customer_id, name as customer_name FROM {{ source('ecom', 'customers') }}

