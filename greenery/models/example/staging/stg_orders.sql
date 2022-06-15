with source_orders as (


    select *  from {{ source('greenery', 'addresses') }}
)
, final as (

    select

        address_id,
        address as street_address,
        zipcode as address_zip_code,
        state as address_state,
        country as address_country

    from source_orders
)

select * from final