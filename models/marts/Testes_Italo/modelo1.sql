{{config(materialized='table')}}

select
    id,
    1*for_sum as soma1
from   
    {{ref('stg_teste_aux')}}
--group by 1, 2