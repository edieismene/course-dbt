with source_orders as (


    select *  from {{ source('greenery', 'orders') }}
)
, final as (

    select
        order_id,
        user_id,
        promo_id,
        address_id,
        created_at,
        order_cost,
        shipping_cost as shipping_cost_amount,
        order_total as order_total_amount,
        tracking_id,
        shipping_service,
        estimated_delivery_at,
        delivered_at,
        status as order_status

    from source_orders
)

select * from final