{% macro grant_select(schema=target.schema, role=target.role) %}

    {% set sql %} -- Setei aqui um SQL que eu quero que rode lá no snowflake sem necessariamente colocá-lo no modelos, fiz através da macro!!!

        grant usage on schema {{ schema }} to role {{ role }};
        grant select on all tables in schema {{ schema }} to role {{ role }};
        grant select on all views in schema {{ schema }} to role {{ role}};

    {% endset %} -- Precisa fechar também o set do sql

    -- Log messages: -- Isso aqui são apenas mensgaens que eu coloco para aparecer no LOG quando eu executo a macro (ajuda a identificar erros)

        {{ log('Granting select on all table and vies in schema' ~ target.schema ~ ' to role ' ~ role, info = True) }}
        
        {% do run_query(sql) %} -- ESTE É O COMANDO run_query(nome_da_query_dentro_do_set) PARA RODAR A QUERY DA MACRO, DENTRO DO SET!!!        
        
        {{ log('Privileges granted', info = True)}}

{% endmacro %}





