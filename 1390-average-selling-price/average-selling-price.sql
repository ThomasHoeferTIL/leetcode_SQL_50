-- Write your PostgreSQL query statement below
select 
pr.product_id
,COALESCE(round(sum(pr.price*us.units)/sum(us.units) :: numeric,2),0) as average_price
from prices pr
left join unitssold us 
    on pr.product_id = us.product_id
where us.purchase_date between pr.start_date and pr.end_date
or us.product_id is null
group by 
pr.product_id