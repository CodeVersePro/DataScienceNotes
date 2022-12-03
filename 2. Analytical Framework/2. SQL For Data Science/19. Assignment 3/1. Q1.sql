
/* insepecting some data */

select * from orders

/* lets find the minimum week according to creation date of user*/

select userid,min(extract(week from created)) as min_week from orders
GROUP BY userid
ORDER BY userid

/* storing week 0 date in TEMPORARY table */

create TEMPORARY TABLE week0 as 
select userid,min(extract(week from created)) as min_week from orders
GROUP BY userid
ORDER BY userid


SELECT * from week0

/* now getting all week of user and storing in TEMPORARY table*/

create TEMPORARY TABLE all_week as
SELECT userid, extract(week from created) as login_week from orders
GROUP BY userid,created
ORDER BY userid,login_week

SELECT * from all_week

/* now lets calculate week number which is 0 for week 1 and so on*//

create TEMPORARY TABLE week_id as
SELECT all_week.userid, all_week.login_week, week0.min_week as first_week, (all_week.login_week - week0.min_week) as week_number from all_week
INNER JOIN week0
on all_week.userid = week0.userid
ORDER BY userid, login_week

ALTER TABLE week_id
RENAME COLUMN min_week to first_week

SELECT * from week_id
ORDER BY first_week


create TEMPORARY TABLE Ten_week_ret as
SELECT first_week,

    sum( CASE WHEN week_number =0 then 1 else 0 END) as week_0,
    sum( CASE WHEN week_number =1 then 1 else 0 END) as week_1,
    sum( CASE WHEN week_number =2 then 1 else 0 END) as week_2
    
from week_id
GROUP BY (first_week)
ORDER BY first_week

SELECT * from ten_week_ret