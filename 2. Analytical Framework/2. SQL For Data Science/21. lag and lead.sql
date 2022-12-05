
create table lag_lead (

    id SERIAL PRIMARY KEY,
    number integer
)

insert into lag_lead (number)
values
(1),
(1),
(1),
(2),
(1),
(2),
(2)

insert into lag_lead(number)
values
(1),
(1),
(1),
(2),
(2),
(3),
(3),
(3)

select * from lag_lead

select number, lead(number) over() as next, lag(number) over() as prev from lag_lead


select distinct number 
from (select number, lead(number) over() as next, lag(number) over() as prev from lag_lead) as demo
where number = next and number = prev 