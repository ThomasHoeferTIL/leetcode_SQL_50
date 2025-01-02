-- Write your PostgreSQL query statement below
select 
c.name
from customer c
where c.referee_id IS NULL
OR Not c.referee_id = 2