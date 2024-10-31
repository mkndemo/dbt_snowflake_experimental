with raw as (
    select * from {{ source('snowplow', 'raw_customers') }}
),
extracted_data AS (
    SELECT 
        c1 as customer_id,
        c2 as first_name,
        c3 as last_name
    FROM 
        raw
)
SELECT *
FROM extracted_data

