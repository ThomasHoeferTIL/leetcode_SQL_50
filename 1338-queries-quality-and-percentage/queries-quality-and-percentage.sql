-- Write your PostgreSQL query statement below
select 
query_name
,round(sum(rating/position::numeric)/count(distinct result),2) as quality
,round((sum(case when rating<3 then 1 else 0 end)::numeric/count(distinct result))*100,2) as poor_query_percentage
from queries
group by query_name
