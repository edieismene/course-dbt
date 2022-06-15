with source_promos as (


    select *  from {{ source('greenery', 'promos') }}
)
, final as (

    select
        promo_id,
        discount as promo_discount,
        status as promo_status

    from source_promos
)

select * from final