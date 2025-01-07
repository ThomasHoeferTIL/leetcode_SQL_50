-- Write your PostgreSQL query statement below


select 
r.contest_id
,round((count(r.user_id)::numeric/(select count(*) from users)::numeric)*100,2) as percentage
from users u
join register r
    on u.user_id = r.user_id
group by r.contest_id
order by percentage desc
,contest_id asc