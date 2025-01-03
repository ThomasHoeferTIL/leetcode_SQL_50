
select 
em.name
from employee em
join employee emid
    on em.id = emid.managerid
group by
    em.name
    ,emid.managerid
having count(emid.managerid) >=5