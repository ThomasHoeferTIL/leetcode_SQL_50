-- Write your PostgreSQL query statement below
select
eu.unique_id
,ee.name
from employees as ee
left outer join employeeUNI eu 
    on ee.id = eu.id