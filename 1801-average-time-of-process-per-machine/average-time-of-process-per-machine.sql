-- Write your PostgreSQL query statement below

with cte_process_time as
    (select 
    machine_id
    ,process_id
    ,(max(timestamp)-min(timestamp)) as "process_time"
    from activity
    group by machine_id,process_id
    order by machine_id
    )    
select 
a.machine_id
,Round(AVG(cte_pt.process_time)::numeric,3) as "processing_time"
from activity as a
join cte_process_time as cte_pt
    on cte_pt.machine_id = a.machine_id
group by a.machine_id
/*

*/
