{% macro dump_table(model_name, limit=100) %}
{# 
    Dumps all columns of a dbt model to the CLI.
    model_name: name of the dbt model to dump
    limit: optional row limit (default 100)
#}

{% set sql %}
    select *
    from {{ ref(model_name) }}
    limit {{ limit }}
{% endset %}

{% set results = run_query(sql) %}

{% if results %}
    {% for row in results %}
        {{ log(row.values() | join(', '), info=True) }}
    {% endfor %}
{% else %}
    {{ log("No rows returned", info=True) }}
{% endif %}

{% endmacro %}
