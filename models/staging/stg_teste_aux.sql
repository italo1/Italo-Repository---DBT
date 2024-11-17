with cte as (
    select * from {{ source('jaffle_shop', 'TESTE_EFICIENCIA_AGREGACAO_AUX') }}
)

select * from cte