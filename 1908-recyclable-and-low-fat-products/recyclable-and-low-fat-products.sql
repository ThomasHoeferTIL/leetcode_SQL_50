-- Write your PostgreSQL query statement below
select 
product_id
from products
where low_fats = 'Y'
And recyclable = 'Y'