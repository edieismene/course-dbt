with source_events as (


    select *  from {{ source('greenery', 'events') }}
)
, final as (

    select
        event_id,
        session_id,
        user_id,
        page_url as event_page_url,
        created_at as event_created_at,
        event_type,
        order_id,
        product_id

    from source_events
)

select * from final