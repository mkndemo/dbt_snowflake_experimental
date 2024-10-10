select
    sales_region as region,
    sales_country as country,
    itemtype as item_type,
    saleschannel as channel,
    orderpriority as priority,
    orderdate
from {{ ref('stg_jaffle_shop__sales_records_1M') }}
