{{config(materialized='table')}}

select
    id,
    4*for_sum as soma4
from   
    {{ ref('stg_teste_aux')}}
--group by for_sum