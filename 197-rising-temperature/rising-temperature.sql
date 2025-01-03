-- Write your PostgreSQL query statement below

with id_lag as (
    select (lag(temperature,1) over (order by recordDate asc)) as "templag"
    ,(lag(recordDate,1) over (order by recordDate asc)) as "datelag"
    ,recordDate
    from weather)

select 
w.id
from weather w
full outer join id_lag as l
    on w.recordDate=l.recordDate
where (DATE_PART('doy', w.recordDate) - DATE_Part('doy',l.datelag) =1
or (DATE_PART('year', w.recordDate) - DATE_Part('year',l.datelag) =1 and DATE_PART('day', w.recordDate) - DATE_Part('day',l.datelag) =-30))
And w.temperature > l.templag


/*

,DATE_PART('day', w.recordDate) - DATE_Part('day',l.recordDate) as "difference"
,l.datelag
,DATE_PART('day', l.recordDate) as day

(select extract(day from w.recordDate - l.recordDate))
*/