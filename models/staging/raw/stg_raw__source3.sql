{{ config(
    materialized='incremental_stream',
    unique_key='pk'
) }}

SELECT
    CAST(pk AS INTEGER) AS pk,
    column_2,
    column_4,
    updated_at,
    '{{ invocation_id }}' AS batch_id
    {{ incr_stream.get_stream_metadata_columns() }}
FROM {{ incr_stream.stream_source('raw', 'source3') }}
