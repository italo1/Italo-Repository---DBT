{{config(materialized='table')}}

select
    id,
    2*for_sum as soma2
from   
    {{ ref('stg_teste_aux')}}
--group by 1, 2