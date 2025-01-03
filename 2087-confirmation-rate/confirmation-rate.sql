-- Write your PostgreSQL query statement below

select 
    s.user_id
    ,case 
        when count(c.user_id) = 0 then 0.00
        else round(sum(case when c.action = 'confirmed' then 1.00 else 0 end)/count(c.user_id) ,2)
        end
        as "confirmation_rate"
from signups s
left join confirmations c
    on c.user_id =s.user_id
group by s.user_id

/*
with counter_timeout as
    (select
    c.user_id
    ,count(c.action)::int as "timeout_count"
    from confirmations c
    where c.action = 'timeout'
    group by c.user_id
    )
,
counter_confirmed as
    (select
    c.user_id
    ,count(c.action)::int as "confirmed_count"
    from confirmations c
    where c.action = 'confirmed'
    group by c.user_id
    )

select 
    s.user_id
    ,case 
        when sum((cc.confirmed_count,0)+coalesce(ct.timeout_count,0)) = 0 then 0
        when sum((cc.confirmed_count,0)+coalesce(ct.timeout_count,0)) != 0 then sum(coalesce(cc.confirmed_count,0)/(coalesce(cc.confirmed_count,0)+coalesce(ct.timeout_count,0)))
    end
from signups s
left join counter_timeout ct
    on s.user_id = ct.user_id
left join counter_confirmed cc
    on s.user_id = cc.user_id
group by s.user_id
*/

/*

s.user_id
,sum(cc.confirmed_count/(cc.confirmed_count+ct.timeout_count))
select
    c.user_id
    ,count(c.action) as "confirmed_count"
    from confirmations c
    where c.action = 'confirmed'
    group by c.user_id
*/