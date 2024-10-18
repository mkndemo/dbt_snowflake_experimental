{% macro convert_cents_to_euro(column_name) -%}
    ({{ column_name }} / 100)
{% endmacro %}