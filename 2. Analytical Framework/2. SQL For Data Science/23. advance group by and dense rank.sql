
/* we are going to lear how to group by over (window) and preceding raw */

create TABLE moving_avg (

        customer_id INTEGER,
        name VARCHAR(100),
        visited_on TIMESTAMp,
        amount integer
)

insert into moving_avg (customer_id,name,visited_on,amount)
values
(1,'John','01-01-2019',100),
(2,'Daniel','02-01-2019',110),
(3,'Jade','03-01-2019',120),
(4,'Khaled','04-01-2019',130),
(5, 'Winston','05-01-2019',110),
(6,'Elvis','06-01-2019',140),
(7,'anna','07-01-2019',150),
(8,'Maria','08-01-2019',180),
(9,'Jaze','09-01-2019',110),
(1,'John','10-01-2019',130),
(2,'Daniel', '10-01-2019',150)

select * from moving_avg


create temporary table total_spent as
select  visited_on, sum(amount) as total from moving_avg
group by visited_on
order by visited_on

select * from total_spent

select visited_on, total, sum(total) over(order by visited_on rows 6 preceding),
round(avg(total) over (order by visited_on rows 6 preceding) ,2)
from total_spent
order by visited_on
OFFSET 6 ROWS






-- end of the above, now just practicing--

create table top_3_sal (

        id integer,
        name varchar(50),
        salary INTEGER,
        dept_id INTEGER
)

insert into top_3_sal (id,name,salary,dept_id)
values
(1,'Joe',85000,1),
(2, 'Henry', 80000, 2),
(3, 'Sam', 60000, 2),
(4, 'Max', 90000, 1),
(5, 'Janet', 69000, 1),
(6, 'Randy', 85000, 1),
(7, 'will', 70000, 1)

select * from top_3_sal

create table top_3_sal_dpt (

    id integer,
    name VARCHAR(100)
)

insert into top_3_sal_dpt (id,name)
values
(1, 'IT'),
(2, 'Sales')


-- our task is to find top3 salary earner in each department -- 

create temporary table top_3_sal_data as
select top_3_sal.dept_id as department_id,
top_3_sal_dpt.name as department,top_3_sal.name as employee_name, salary, 
dense_rank() over(partition by dept_id order by salary DESC) as rank
from top_3_sal
inner join top_3_sal_dpt
on top_3_sal.dept_id = top_3_sal_dpt.id
order by dept_id, salary DESC


select * from top_3_sal_data
where rank <= 3
