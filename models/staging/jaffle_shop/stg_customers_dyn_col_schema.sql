-- models/staging/stg_customer.sql

{% set columns = get_table_columns('jaffle_shop', 'orders') %}

select
    id as customer_id,
    {% for column in columns %}
        {{ column }}{% if not loop.last %},{% endif %}
    {% endfor %}
from {{ source('jaffle_shop', 'orders') }}
