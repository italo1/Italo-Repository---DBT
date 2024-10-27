{{
    config(
        materialized = 'view'
    )
}}

with customers as (
    select
        customer_id,
        name
    from
        {{ ref('stg_jaffle_shop__customers') }}
),

orders as (
    select
        order_id,
        customer_id,
        order_date
    from
        {{ ref('stg_jaffle_shop__orders') }}
),

customer_orders as (
    select
        customer_id,
        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders
    from
        orders
    group by 1
),

final as (
    select
        customers.customer_id,
        customers.name,
        customer_orders.first_order_date,
        customer_orders.most_recent_order_date,
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders
    from 
        customers
    left join customer_orders -- OR... I could use: using (customer_id) -->> Instead of using the Keys names
        on customers.customer_id = customer_orders.customer_id -- using (customer_id)
)

select * from final