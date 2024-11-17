{{config(materialized='table')}}

with cte5 as (
    select * from {{ ref('test_for_optimizing_with_reference_in_snowflake') }}
    union all
    select * from {{ ref('Big_table_as_a_source') }}
),
cte6 as (
    select * from cte5 group by all
)
select * from cte6