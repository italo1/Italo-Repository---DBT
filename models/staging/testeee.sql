with 
source as (

    select * from {{ source('jaffle_shop', 'stores') }}
)

select * from source