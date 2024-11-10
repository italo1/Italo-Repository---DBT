{{config(materialized='table')}}

select
    id,
    3*for_sum as soma3
from   
    {{ ref('stg_teste_aux')}}
--group by for_sum