{% test unique(model, column_name) %}

WITH validation AS (
    SELECT
        {{ column_name }} AS value,
        COUNT(*) AS count
    FROM {{ model }}
    GROUP BY value
    HAVING COUNT(*) > 1
)

SELECT * FROM validation

{% endtest %}