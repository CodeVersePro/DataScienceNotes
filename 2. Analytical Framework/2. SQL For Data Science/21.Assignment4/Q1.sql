
show datestyle
create Table salary (

    id serial PRIMARY KEY,
    employee_id integer,
    amount INTEGER,
    pay_date TIMESTAMP
)

insert into salary (employee_id,amount,pay_date)
values
(1,9000,'31-03-2017'),
(2,6000, '31-03-2017'),
(2,10000,'31-03-2017'),
(1,7000,'28-02-2017'),
(2,6000,'28-02-2017'),
(2,8000,'28-02-2017')

select * from salary

CREATE TABLE department (

    
    employee_id integer,
    department_id integer 
)

INSERT INTO department (employee_id, department_id)
VALUES
(1,1),
(2,2),
(3,2)

SELECT * from department

create TEMPORARY TABLE employee_data2 as
SELECT salary.employee_id,department_id, amount, extract(month from pay_date) as Month,
round(avg(amount)  over(partition by department_id),2) as avg_salary_dpt
from salary
INNER JOIN department
on salary.employee_id = department.employee_id

select * from employee_data2

CREATE TEMPORARY TABLE employee_data3 as
SELECT salary.employee_id,department_id, amount, extract(month from pay_date) as Month,
round(avg(amount)  over(partition by department_id),2) as avg_salary_dpt,
round(avg(amount) over(),2) as average
from salary
INNER JOIN department
on salary.employee_id = department.employee_id


SELECT * from employee_data3




