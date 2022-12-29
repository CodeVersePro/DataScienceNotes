
create table student (

    student_id integer,
    student_name VARCHAR(50)
)

insert into student(student_id,student_name)
values
(1,'Daniel'),
(2,'Jade'),
(3,'Stella'),
(4,'Jonathan'),
(5,'Will')

create table exam (

    exam_id integer,
    student_id integer,
    score integer

)

insert into exam (exam_id,student_id,score)
values
(10,1,70),
(10,2,80),
(10,3,90),
(20,1,80),
(30,1,70),
(30,3,80),
(30,4,90),
(40,1,60),
(40,2,70),
(40,4,80)

select * from student
select * from exam

create temporary table student_data as
select student.student_id, student_name, exam_id,score from student
inner join exam
using(student_id)

select * from student_data

select exam_id,student_id,sum(score) as score from student_data
group by exam_id,student_id
order by exam_id

create temporary table student_data_count as
select *,count(score) over(partition by exam_id) from (select exam_id,student_id,sum(score) as score from student_data
group by exam_id,student_id
order by exam_id) as t


create temporary table student_matrix as
select *, 
case when score = (max(score) over (partition by exam_id)) then 'Max'
When score = (min(score) over (partition by exam_id)) Then 'Min'
Else 'Avg'
END as some
from student_data_count
where count > 2 

select distinct * from student_matrix
where student_matrix.some = 'Avg'

select student_name from student
where student_id in (select student_id from student_matrix
where student_matrix.some = 'Avg' and student_matrix.some != 'Max')

-- here we got two otput 1,2 but we need to rule out id 2 as it scored high marx once --

select distinct student_id from student_matrix
where student_matrix.some = 'Max' or student_matrix.some = 'Min'

select distinct * from student_matrix
where student_id not in (select distinct student_id from student_matrix
where student_matrix.some = 'Max' or student_matrix.some = 'Min')

select student_id, student_name from student
where student_id in (select distinct student_id from student_matrix
where student_id not in (select distinct student_id from student_matrix
where student_matrix.some = 'Max' or student_matrix.some = 'Min')) ARRAY

-- here is our answer --

