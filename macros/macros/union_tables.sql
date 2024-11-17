--Macro que une 2 tabelas ou mais... no argumento da função é necessário passar

{% macro union_tables(tables) %}
    {% for table in tables %}
        select * from {{table}}
        {% if not loop.last%}
        UNION
        {% endif %}
    {% endfor %}
{% endmacro %}