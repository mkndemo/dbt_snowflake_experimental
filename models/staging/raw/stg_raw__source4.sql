{{ config(
    materialized='incremental_stream',
    unique_key='pk'
) }}

SELECT
    CAST(pk AS INTEGER) AS pk,
    column_5,
    column_200,
    updated_at,
    '{{ invocation_id }}' AS batch_id
    {{ incr_stream.get_stream_metadata_columns() }}
FROM {{ incr_stream.stream_source('raw', 'source4') }}
