/* lets create a table employees */

create table employees(

        employee_id SERIAL PRIMARY KEY,
        first_name VARCHAR(50) not NULL,
        last_name VARCHAR(50) not null,
        birth_date date not null check (birth_date < '2000-01-01'),
        hiring_date date not NULL check (hiring_date > '2010-01-01'),
        salary INTEGER not null check (salary > 25000)

)


select * from employees

insert into employees(first_name,last_name,birth_date,hiring_date,salary)
values ('hitesh','solanki','2001-01-01','2009-01-01',20000) /* check constarint will throw error */

insert into employees(first_name,last_name,birth_date,hiring_date,salary)
values ('hitesh','solanki','1999-01-01','2009-01-01',20000)  /* changed birth date */

insert into employees(first_name,last_name,birth_date,hiring_date,salary)
values ('hitesh','solanki','1999-01-01','2011-01-01',20000) /*hiring date constarint solved but salary*/

insert into employees(first_name,last_name,birth_date,hiring_date,salary)
values ('hitesh','solanki','1999-01-01','2011-01-01',26000) 

select * from employees