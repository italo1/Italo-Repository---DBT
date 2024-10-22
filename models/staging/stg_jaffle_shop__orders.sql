{{
    config(
        materialized = 'view'
    )
}}

select
    id as order_id,
    customer as customer_id,
    ordered_at as order_date
from
    raw.jaffle_shop.orders