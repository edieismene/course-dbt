with user_orders_count as (

    select  user_id
            ,count(distinct order_id) as order_count

    from   dbt_edie_n.stg_orders
    group by 1

)

,user_orders_count_buckets as (

    select  user_id
            ,case when order_count >= 2 then 'true' else 'false' end as repeat_user

    from    user_orders_count
)

select 
sum(case when repeat_user = 'true' then 1 else 0 end)::float / count(distinct user_id)::float as user_repeat_rate

from user_orders_count_buckets