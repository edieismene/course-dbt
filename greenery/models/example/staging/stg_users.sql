with source_users as (


    select *  from {{ source('greenery', 'users') }}
)
, final as (

    select
        user_id,
        first_name as user_first_name,
        last_name as user_last_name,
        email as user_email,
        phone_number as user_phone_number,
        created_at as user_created_at,
        updated_at as user_updated_at,
        address_id

    from source_users
)

select * from final