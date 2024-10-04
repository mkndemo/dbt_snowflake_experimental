select
    id as customer_id,
    first_name,
    last_name,
    updated_at as loaded_date

from {{ source('raw', 'db1') }}
