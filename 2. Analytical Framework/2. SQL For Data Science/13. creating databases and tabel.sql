
CREATE Table account (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(40) UNIQUE NOT NULL,
    password VARCHAR(40) NOT NULL,
    email VARCHAR(250) UNIQUE NOT NULL,
    created_on TIMESTAMP NOT NULL,
    last_login TIMESTAMP
)


CREATE Table job (

    job_id SERIAL PRIMARY KEY,
    job_name VARCHAR(250) unique not NULL

)

Create table hiring_detail (

    hiring_id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES account(user_id),
    job_id INTEGER REFERENCES job(job_id),
    hiring_date TIMESTAMP

)


/* how to insert values in craeted table */

insert into account (username, password, email, created_on)
values ('hitesh2603', 'mypassword', 'codeversepro@gmail.com', current_timestamp)

insert into account (username, password, email, created_on)
values ('hitesh2604', 'mypassword', 'codeversepro4@gmail.com', current_timestamp)

select * from account

insert into job (job_name)
values ('Data Scientist')

insert into job (job_name)
values ('Data analyst')

insert into job (job_name)
values ('financial analyst')

select * from job

insert into hiring_detail (user_id,job_id,hiring_date) /* we does not specified job_id and account_id */
values (1,1,current_date)

insert into hiring_detail (user_id,job_id,hiring_date) /* we does not specified job_id and account_id */
values (3,2,current_date)

select * from hiring_detail


/* how to update tabel values */

update account
set last_login = current_timestamp

select * from account

update account
set last_login = created_on



/* updating with condition */

update account
set created_on = '01-01-2022'
where user_id = 1

update account
set created_on = '02-02-2022'
where user_id = 3

update hiring_detail
set hiring_date = account.created_on
from account
where hiring_detail.user_id = account.user_id

select * from hiring_detail


/* altering table using alter */

create table information (

        info_id SERIAL PRIMARY KEY,
        title VARCHAR(250) not NULL,
        person VARCHAR(50) UNIQUE not NULL

)


select * from information

/* renaming table using alter */

alter table information
rename to information_new

/* renaming column using alter */

alter table information_new
rename column title to intro

/* lets enter some infor mation to information table for experimnet */

insert into information_new (intro,person)
values ('My intro','Hitesh')

select * from information_new

/* how to change constarint using alter */

insert into information_new(intro)
values ('some intro') /* first it will throw some eroor because of not null costaint in person */

alter table information_new
alter column person drop not null /* it will drop not null */

insert into information_new(intro)
values ('some intro') /* now it will work */

select * from information_new

/* we can set constaint usig alter */

alter table information_new
alter column person set not null /* currently not work because already contain some null values */


/* how to drop table and column using alter */

alter table information_new
drop column if exists person

select * from information_new

/* how to drop whole table */

drop table information_new






