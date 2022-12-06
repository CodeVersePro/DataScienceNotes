
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

create TEMPORARY TABLE salary_comp as
SELECT distinct department.department_id ,amount, to_char(pay_date, 'yyyy-mm') as month,
round(avg(amount) over(PARTITION BY extract(month from pay_date), department_id) ,2) as month_dpt_avg,
round(avg(amount) over(PARTITION BY extract(month from pay_date)) ,2)as month_avg_company
from salary
inner JOIN department
on salary.employee_id = department.department_id
order by to_char(pay_date, 'yyyy-mm')

select distinct month,department_id, 
case when month_dpt_avg = month_avg_company Then 'Same'
WHEN month_dpt_avg > month_avg_company THEN 'Higher'
ELSE 'Lower' END as Comparision
from salary_comp
order by month



