{{config(materialized='table')}}

with cte1 as (
select
    id,
    7*soma1
from   
    {{ ref('modelo1')}}
--group by 1, 2
),
cte2 as (
select
    id,
    6*soma2
from   
    {{ ref('modelo2')}}
--group by 1, 2
),
cte3 as (
select
    id,
    5*soma3
from   
    {{ ref('modelo3')}}
--group by 1, 2
),
cte4 as (
select
    id,
    4*soma4
from   
    {{ ref('modelo4')}}
--group by 1, 2
),
cte5 as (
select
    id,
    3*soma5
from   
    {{ ref('modelo5')}}
--group by 1, 2
),
cte6 as (
select
    id,
    2*soma6
from   
    {{ ref('modelo6')}}
--group by 1, 2
),
cte8 as (
select * from cte1
union all
select * from cte2
union all
select * from cte3
union all
select * from cte4
union all
select * from cte5
union all
select * from cte6
)

select * from cte8
