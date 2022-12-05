
CREATE Table employee_avg (

    depname VARCHAR(50),
    empno INTEGER,
    salary INTEGER

)

insert into employee_avg(depname,empno,salary)
values 
('develop',11,5200),
('develop',7,4200),
('develop',9,4500),
('develop',8,6000),
('develop',10,5200),
('persone1',5,3500),
('persone1',2,3900),
('sales',3,4800),
('sales',1,5000),
('sales',4,4800)

select * from employee_avg

/* if we want to find average, we need to apply group by but it will shrink raws, this can be solved using window*/

select depname,empno,salary, avg(salary) over (partition by depname) as average_salary from employee_avg