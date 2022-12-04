

/* for question 3 lets make table */

CREATE Table log (

    employee_id INTEGER not null,
    action VARCHAR(10) NOT NULL,
    created timestamp NOT NULL


)

/* lets insert some values */

insert into log (employee_id,action,created)
values
(1,'IN', '2019-04-01 12:00:00'),
(1,'OUT', '2019-04-01 15:00:00'),
(1,'IN', '2019-04-01 17:00:00'),
(1,'OUT', '2019-04-01 21:00:00')

select * from log

create temporary table log2 as
select employee_id, action, cast(created as date) as date, cast(created as time) as time, created from log

select * from log2