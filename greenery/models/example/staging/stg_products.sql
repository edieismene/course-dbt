with source_products as (


    select *  from {{ source('greenery', 'products') }}
)
, final as (

    select
        product_id,
        name as product_name,
        price as product_price_amount,
        inventory as product_inventory

    from source_products
)

select * from final