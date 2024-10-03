{% macro get_table_columns(source_name, table_name) %}
    {% set relation = source(source_name, table_name) %}
    {% set columns = adapter.get_columns_in_relation(relation) %}
    {% set column_names = columns | map(attribute='name') | list %}
    {{ return(column_names) }}
{% endmacro %}