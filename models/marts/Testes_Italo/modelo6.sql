{{config(materialized='table')}}

select
    id,
    6*for_sum as soma6
from   
    {{ ref('stg_teste_aux')}}
--group by for_sum