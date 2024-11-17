{{
    config(
        materialized='incremental', unique_key='ROW_NUM'
        )
}}

with transform_cte as (
    select * from {{ source('jaffle_shop', 'TESTE_EFICIENCIA_AGREGACAO_AUX') }}
    {% if is_incremental() %}
    where row_num >= (select max(row_num) from {{this}})
    {% endif %}
),

transforming_cte as (
    select * from transform_cte
)

select * from transforming_cte