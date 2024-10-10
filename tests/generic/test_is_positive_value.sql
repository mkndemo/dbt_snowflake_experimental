{% test is_positive_value(model, column_name) %}

with validation as (

    select
        {{ column_name }} as positive_field
    from {{ model }}

),

validation_errors as (

    select positive_field
    from validation
    -- if this is true, then even_field is actually negative!
    where (positive_field < 0)

)

select *
from validation_errors

{% endtest %}