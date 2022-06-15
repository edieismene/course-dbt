with source_order_items as (


    select *  from {{ source('greenery', 'order_items') }}
)
, final as (

    select
        order_id,
        product_id,
        quantity as ordert_item_quantity

    from source_order_items
)

select * from final