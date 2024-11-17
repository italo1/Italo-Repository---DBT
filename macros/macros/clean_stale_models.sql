{#  
    -- let's develop a macro that 
    1. queries the information schema of a database
    2. finds objects that are > 1 week old (no longer maintained)
    3. generates automated drop statements
    4. has the ability to execute those drop statements

#}


{% macro clean_stale_models(database=target.database, schema=target.schema, days=7, dry_run=True) %} -- inseri os defalts values
    
    {% set get_drop_commands_query %} -- TOP!!! setei uma query para ser executada lá no snowflake
        select
            case 
                when table_type = 'VIEW' -- quando o nome da tabela for uma view, permita este nome, caso contrário, todo o resto que não for uma view vira uma 'TABLE'
                    then table_type
                else 
                    'TABLE'
            end as drop_type,
            'DROP ' || drop_type || ' {{ database | upper }}.' || table_schema || '.' || table_name || ';' -- TOP!!! Olha só que bacana, aqui eu uso o | para passar o nome do database no filtro! então ficaria em maiúsculo o resultado... e o || serve para concatenar as strings EM SQL...
        from {{ database }}.information_schema.tables 
        where table_schema = upper('{{ schema }}') -- poderia ser também: '{{ schema|upper }}'
        and last_altered <= current_date - {{ days }} 
    {% endset %}

    {{ log('\nGenerating cleanup queries...\n', info=True) }} -- printa a mensagem de log de limpeza executada para cada query
    {% set drop_queries = run_query(get_drop_commands_query).columns[1].values() %} -- TOP!!! setou uma variável recebendo um run_query da segunda coluna (as colunas começam com 0) e pegou os values da coluna inteira (todas as linhas)
    -- Maneira interessantíssima de usar o run_query acima! uma variaável recebeu o valor de toda uma coluna do run_query!
    {% for query in drop_queries %} -- TOP!!!  O for agora vai varrer cada elemento desta lista da variável run_query.columns[1].values()
        {% if dry_run %}
            {{ log(query, info=True) }}
        {% else %}
            {{ log('Dropping object with command: ' ~ query, info=True) }} -- Esse caracter '~' serve para concatenar a string com a informação logo a frente
            {% do run_query(query) %}
        {% endif %}       
    {% endfor %}
    
{% endmacro %} 

--OBS IPCCCCC:
-- '||' (Concatenador de Strings em SQL)
-- '~' (Concatenador em Jinja/DBT)