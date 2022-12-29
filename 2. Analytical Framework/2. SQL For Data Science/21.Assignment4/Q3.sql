create table stadium (

    id integer,
    visit_date timestamp,
    people VARCHAR(100)
)

insert into stadium(id,visit_date,people)
values
(1,'01-01-2017',10),
(2,'02-01-2017',109),
(3,'03-01-2017', 150),
(4,'04-01-2017',99),
(5,'05-01-2017', 145),
(6,'06-01-2017', 1455),
(7,'07-01-2017', 199),
(8, '08-01-2017', 188)


drop table stadium_data_ll

create temporary table stadium_data_ll as
select visit_date, cast(people as integer) , cast(lead(people) over() as integer )as next ,
cast(lag(people) over() as integer) as prev , 
cast(lead(people, 2) over () as integer) as next2,
cast(lag(people, 2) over () as integer) as prev2,
id as id
from stadium

select id,visit_date, people from stadium_data_ll
where (people > 100 and next > 100 and prev > 100) or
(people > 100 and next > 100 and next2 > 100) or
(people > 100 and prev > 100 and prev2 > 100)


-- above query return the answer -- 