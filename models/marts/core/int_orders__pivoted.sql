--quero somar apenas para os customer_id que então entre determinados valores...
--além disso quero printar alguns itens da lista criada por mim, especificamente de algumas posiçoes da lista...
{% set list_of_customers_id = ['96c8937f-d99c-4515-acec-db24d07768f9', '7cd5e7f3-39c8-48ce-950a-1b70449e7829', 'dd3b89f6-3929-46fc-91cb-d62cee594688', '026f0a0c-400a-4482-a51f-c8bd57fb07df', '7c76af9c-d5fd-460e-82d9-5a7b2a4a118b'] %}

with cte1 as (
    select * from {{ ref('stg_orders') }}
),

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

select * from cte2

--------------------













