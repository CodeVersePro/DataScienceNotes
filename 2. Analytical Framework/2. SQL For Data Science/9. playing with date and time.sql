/* some useful command */

SHOW timezone

SELECT now()
SELECT timeofday()
SELECT current_time
SELECT current_date

SELECT * from payment

/* how to get year from timestamp */

SELECT extract(year from payment_date) as payment_year from payment

SELECT extract(month from payment_date) as payment_month from payment

SELECT extract(day from payment_date) as payment_day from payment

/*calculating payment age */

SELECT age(payment_date) as payment_age from payment

/* converting date into char */

SELECT to_char(payment_date, 'date/month/yyyy') as payment_date_2 from payment
