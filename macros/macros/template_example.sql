{% macro template_example() %}

    {% set query %}

        select true as bool -- just for example... I created a single line and column table

    {% endset %}

    {% if execute %}
        {% set results = run_query(query).columns[0].values()[0] %} -- Essa é a sintaxe para pegar na matriz da tabela a coluna 0 e a linha 0
        select
            {{results}} as is_real
        from
            a_real_table -- as an example of a table...
    {% endif %}

{% endmacro %}