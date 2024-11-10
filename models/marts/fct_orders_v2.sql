with orders as (
    select * from {{ ref('int_orders') }}
),

final as (
    select 
        order_id,
        location_id,
        customer_id,
        order_total as order_amount,
        tax_paid,
        {{test_macro_order_total_with_tax_paid('order_amount', 'tax_paid')}} as test,
        -- Preciso passar o nome da coluna entre aspas para passar todos os valores para a MACRO!!!!!!!
        -- IPC: Você pode passar o nome da coluna mesmo ou o alias dela dentro do select no argumento da MACRO
        -- É necessário colocar o nome da macro entre {{my_macro_name()}} e colocar o () mesmo que não seja necessário passar argumentos
        -- Lembre que o JINJA É APENAS UM TEMPLATE então tudo o que tem dentro da Macro vai vir aqui para dentro do select!!!
        ordered_at,
        customer_name,
        location_name,
        tax_rate,
        cast(location_opened_at as date) as location_opened_at,
        date_part(month, ordered_at) as ordered_month,
        date_part(day, ordered_at) as ordered_day, 
        date_part(year, ordered_at) as ordered_year
    from orders
    {{general_filter('ordered_year')}} -- para chamar uma macro! NESTE CASO A MACRO É UM FILTRO!
-- OBS: POSSO CHAMAR UMA MACRO OU UTILIZAR O JINJA EM QUALQUER LUGAR! LEMBRE QUE O JINJA NADA MAIS É DO QUE UMA LINGUAGEM DE TEMPLATE!!!
)

select * 
from final
