-- Write your PostgreSQL query statement below
select 
v.customer_id
,count(v.customer_id) as "count_no_trans"
from visits v
full outer join transactions t 
    on v.visit_id = t.visit_id
where transaction_id is NULL
group by v.customer_id