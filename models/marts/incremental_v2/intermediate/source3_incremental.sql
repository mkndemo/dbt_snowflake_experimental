{{ config(
    materialized='incremental',
    unique_key='PK',
    incremental_strategy='merge'
) }}

SELECT
    PK,
    Column_2,
    Column_4,
    updated_at,
     '{{ invocation_id }}' as batch_id
FROM {{ ref('stg_source_tables__source3') }}
{% if is_incremental() %}
WHERE updated_at > (SELECT MAX(updated_at) FROM {{ this }})
{% endif %}
