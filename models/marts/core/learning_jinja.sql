    -------------------------- BEGGINING of JINJA:
    
{#
/*
{%set oi='Hello, World!'%}
select '{{oi}}' -- type varchar
---------------------
{%set my_second_variable=2%}
select {{my_second_variable}} -- type integer
---------------------
{%set my_first_list = ['oi', 'beleza', 'e ai']%}
select '{{my_first_list[0]}}' --pegando o primeiro valor do vetor
--iMPORTANTE RESSALTAR QUE DEVEMOS USAR O '' PARA PRINTAR AS STRINGS NO SELECT
---------------------
{%set my_first_list = ['oi', 'beleza', 'e ai']%}
select
    {% for var_test in my_first_list %}
    '{{var_test}}'
    {% if not loop.last %} -- loop,last é uma função primordial para as queries!!! colocamos vírgulas até a última linha do SELECT!!!
    ,
    {% endif %}
    {% endfor %}
---------------------

{% set my_first_list = [1, 2, 3] %}

select
    {% for vector_of_variables in my_first_list %}
    {% if vector_of_variables == 2 %} -- Se usa == e não apenas = no JINJA!!!
    -- IMPORTANTE RESSALTAR QUE QUANDO ESTAMOS FORA DO BLOCO CONDICIONAL, CHAMAMOS A VARIÁVEL COM {{}} E DENTRO DO IF NÃO USAMOS O {{}}!!!!!!!!!
    'é o 2'
    {% else %}
    'não é o 2'
    {% endif %}
    {% if not loop.last %}
    ,
    {% endif %}
    {% endfor %}
    ---------------------

{% set temperature = 45 %}

select
    {% if temperature < 60 %}
    'Está frio'
    {% else %}
    'Está calor'
    {% endif %}
    ---------------------

{% set foods = ['carrot', 'hotdog', 'pepper', 'cucumber'] %}
{% set food_type = '' %}

select
    {% for food in foods %}
        {% if food == 'hotdog' %}
           {% set food_type = 'snack' %}
            --{{food_type}} = 'snack' -- IMPORTANTE RESSALTAR QUE TODA VARIÁVEL QUE ASSUME UM NOVO VALOR, EU PRECISO FAZER O {% SET ...%}, NÃO POSSO FAZER IGUAL O COMENTÁRIO ABAIXO!!!
        {% else %} 
           {% set food_type = 'vegetable' %}
           --{{food_type}} = 'vegetable'
        {% endif %}
        'The {{food}} is a {{food_type}}'
        {% if not loop.last %} -- lembre que precisa sempre do loop.last para colocar as vírgulas e retirá-la no final
        ,
        {% endif %}
    {% endfor %}
    ---------------------
-- nÃO É JINJA MAS É IMPORTANTE: NÃO ESQUEÇA DO end NO FINAL DO CASE WHEN!!! EU ESTAVA ERRANDO DIRETO ISSO!!!
    ---------------------
cte2 as (
    select
        {% for customer_id_list in list_of_customers_id %}
            case when customer_id = '{{customer_id_list}}' then order_total else '0' end -- NÃO ESQUEÇA DO END AQUI!!!! NO FINAL DO CASE!!!!!
            -- É assim igual está acima que pegamos o elemento da tabela e comparamos com os elementos da nossa lista!!! entenda isso!!!
        {% if not loop.last %}
        ,
        {% endif %}
        {% endfor %}
    from
        cte1
--  where customer_id = '{{list_of_customers_id[0]}}' -- Lembre sempre de colocar '{{variable}}' quando for uma string ou char
)
#}
    ---------------------------------------------------------------











