{{ config(
    materialized='table'
) }}

SELECT
    PK,
    Column_3,
    updated_at,
     '{{ invocation_id }}' as batch_id
FROM {{ ref('stg_source_tables__source2') }}

