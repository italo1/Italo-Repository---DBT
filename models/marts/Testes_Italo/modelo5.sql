{{config(materialized='table')}}

select
    id,
    5*for_sum as soma5
from   
    {{ ref('stg_teste_aux')}}
--group by for_sum