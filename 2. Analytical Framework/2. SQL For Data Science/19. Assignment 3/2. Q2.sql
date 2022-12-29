ALTER DATABASE "ASM3_Q2" SET datestyle TO SQL,YMD


create table order_timeline (

    schema_id INTEGER,
    order_id INTEGER,
    message JSON,
    created TIMESTAMP

)

select * from order_timeline
order by order_id 

create table order_shipment (

    schema_id INTEGER,
    order_id integer,
    actual_dispatch_date TIMESTAMP
    
)

SELECT * from order_shipment
ORDER BY order_id



/* part one is to find %of order shipped before 1st message date */

/* we are using cast for extracting json data and changing date and removing timezone*/

create TABLE order_table2 as
SELECT order_timeline.order_id, cast(message ->> 'dispatch_date' as date) as dispatch_date, cast(actual_dispatch_date as date) FROM order_timeline
INNER JOIN order_shipment
on order_timeline.order_id = order_shipment.order_id

SELECT * from order_table2



/* finding order_id where actual_dispatch_date < dispatch_date */

create TEMPORARY TABLE dispatch_early as
select order_id, dispatch_date, actual_dispatch_date from order_table2
WHERE actual_dispatch_date <= dispatch_date /* this are the date showing before */

SELECT count(*) from dispatch_early

SELECT * from dispatch_early

/* finding percentage of early dipatch */

select (((SELECT count(*) from dispatch_early) * 100) / (SELECT count(*) from order_table2))

/* it is showing that 86% */






/* now the part 2,  */

/* finding percentage of order_dispatched on date + 1 day */

create TEMPORARY TABLE next_day_dispacth as 
select order_id, dispatch_date, actual_dispatch_date from order_table2
WHERE (dispatch_date + 1) = actual_dispatch_date
order by dispatch_date

SELECT count(*) from next_day_dispacth


/* now finding % of next_day_dispatch */

select (((SELECT count(*) from next_day_dispacth) * 100) / (SELECT count(*) from order_table2))

select ( ((SELECT count(*) from next_day_dispacth) * 100) / (SELECT count(*) from order_table2) )

/* the answerr is near one percent */




/* finding percentage of order shiped on +2 day */

select * from order_table2

CREATE TEMPORARY TABLE two_day_dispatch as 
SELECT order_id,dispatch_date,actual_dispatch_date from order_table2
WHERE dispatch_date + 2 = actual_dispatch_date
order by dispatch_date

/* now lets find % of two_day_dispatch */

select ( ((SELECT count(*) from two_day_dispatch) * 100) / (SELECT count(*) from order_table2) )




/* order shiped after 2 days */

CREATE TEMPORARY TABLE let_dispatch as
SELECT order_id,dispatch_date,actual_dispatch_date from order_table2
WHERE not dispatch_date + 1 = actual_dispatch_date AND
not dispatch_date + 2 = actual_dispatch_date AND
not actual_dispatch_date <= dispatch_date

/* now lets find percentage */

SELECT * from let_dispatch

select ( ((SELECT count(*) from let_dispatch) * 100) / (SELECT count(*) from order_table2) )


/*solving above problem using case */

select * from order_table2


create TEMPORARY table final_result AS
SELECT

ROUND(SUM ( CASE WHEN actual_dispatch_date <= dispatch_date THEN 1 ELSE 0 END) * 100.00 / count (*) ,2)AS Early_dispatch,
ROUND(SUM ( CASE WHEN actual_dispatch_date = dispatch_date + 1 THEN 1 ELSE 0 END) * 100.00 / count (*),2) AS nextDay_dispatch,
ROUND(SUM ( CASE WHEN actual_dispatch_date = dispatch_date + 2 THEN 1 ELSE 0 END) * 100.00 / count (*),2) AS SecondDay_dispatch,
ROUND(SUM ( CASE WHEN actual_dispatch_date > dispatch_date + 2 THEN 1 ELSE 0 END) * 100.00 / count (*),2) AS Let_dispatch

from order_table2

select * from final_result