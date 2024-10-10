--This test validates that the first order date is not greater than the most recent order date.

select
    customer_id,
    first_ordered_at
from {{ ref('dim_customers' ) }}
where first_ordered_at > last_ordered_at
