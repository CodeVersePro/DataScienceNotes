
create table orders (

    order_id INTEGER,
    customer_id INTEGER,
    order_date TIMESTAMP,
    item_id INTEGER,
    quantity integer    

)

insert into orders (order_id,customer_id,order_date,item_id,quantity)
values
(1,1,'01-06-2020',1,10),
(2,1,'08-06-2020',2,10),
(3,2,'02-06-2020',1,5),
(4,3,'03-06-2020',3,5),
(5,4,'04-06-2020',4,1),
(6,4,'05-06-2020',5,5),
(7,5,'05-06-2020',1,10),
(8,5,'14-06-2020',4,5),
(9,5,'21-06-2020',3,5)

select * from orders


create table items (

    intem_id integer,
    intem_name varchar(100),
    intem_catagory VARCHAR(100)

)

insert into items(intem_id, intem_name, intem_catagory)
values
(1,'LC alg book', 'Book'),
(2, 'LC db book', 'Book'),
(3, 'LC smartphon', 'Phone'),
(4, 'LC phone 2020', 'Phone'),
(5, 'LC smartglass', 'Glasses'),
(6, 'LC t-shirt xl', 'T-shirt')

select * from items

create temporary table order_data_rjoin as
select orders.order_id as order_id,
orders.customer_id as customer_id,
orders.item_id as item_id,
orders.order_date as order_date,
orders.quantity as quantity,
items.intem_name as Item,
items.intem_catagory
from orders
right join items
on orders.item_id = items.intem_id


select * from order_data_rjoin

select extract(dow from order_date) from order_data

select intem_catagory, to_char(order_date, 'day') as day, sum(quantity) from order_data_rjoin
group by intem_catagory , to_char(order_date, 'day')
order by intem_catagory


create temporary table t1 as
select distinct intem_catagory,
CASE WHEN extract(dow from order_date) = 1 THEN sum(quantity) OVER mw ELSE 0 END as Monday,
CASE WHEN extract(dow from order_date) = 2 THEN sum(quantity) over mw ELSE 0 END as Tuesday,
CASE WHEN extract(dow from order_date) = 3 THEN sum(quantity) over mw ELSE 0 END as Wednesday,
CASE WHEN extract(dow from order_date) = 4 THEN sum(quantity) over mw  ELSE 0 END as Thursday,
CASE WHEN extract(dow from order_date) = 5 THEN sum(quantity) over mw ELSE 0 END as Friday,
CASE WHEN extract(dow from order_date) = 6 THEN sum(quantity) over mw  ELSE 0 END as Saturday,
CASE WHEN extract(dow from order_date) = 0 THEN sum(quantity) over mw ELSE 0 END as Sunday
from order_data_rjoin
window mw as (partition by intem_catagory,to_char(order_date, 'Day'))


select * from t1

select intem_catagory, sum(monday) as Monday , sum(tuesday) as Tuesday, sum(wednesday) as Wed, sum(thursday) as Thurs,
sum(friday) as friday, sum(saturday) as sat, sum(sunday) as sunday
from t1
group by intem_catagory
order by intem_catagory



