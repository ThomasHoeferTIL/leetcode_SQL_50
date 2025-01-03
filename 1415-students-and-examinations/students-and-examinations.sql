-- Write your PostgreSQL query statement below
/*
with cte_attended_exams as
    (select 
        s.student_id
        ,s.student_name
        ,e.subject_name
        ,count(*) as "attended_exams"
    from students s
    join examinations e
    on e.student_id = s.student_id
    group by 
        s.student_id
        ,s.student_name
        ,e.subject_name
    )
*/
select 
    st.student_id
    ,st.student_name
    ,su.subject_name
    ,count(ex.student_id) as "attended_exams"
from students st
cross join subjects su 
left join examinations ex
    on st.student_id = ex.student_id and su.subject_name = ex.subject_name
group by
    st.student_id
    ,st.student_name
    ,su.subject_name
order by 
    st.student_id 
    ,su.subject_name