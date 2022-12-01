
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


select * from account

insert into job (job_name)
values ('Data Scientist')

select * from job

insert into hiring_detail (user_id,job_id,hiring_date) /* we does not specified job_id and account_id */
values (1,1,current_date)

select * from hiring_detail

