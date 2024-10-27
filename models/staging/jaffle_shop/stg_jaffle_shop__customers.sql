{{
    config(
        materialized='view'
    )
}}

select
    id as customer_id,
    name
from
    {{ source('jaffle_shop_course', 'customers') }}