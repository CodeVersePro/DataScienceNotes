/* sql string trciks */

SELECT * from customer

/* calculating length of char */

SELECT LENGTH(first_name) as first_name_length FROM customer
ORDER BY LENGTH(first_name) DESC

/* concatinating two string column */

SELECT first_name || ' ' || last_name as full_name FROM customer

/* chanding string style */

SELECT upper(first_name) FROM customer

SELECT upper(first_name) || ' ' || upper(last_name) as full_name from customer

SELECT lower(first_name) || ' ' || lower(last_name) as full_name from customer

/* using left and right to selec text */

SELECT upper(LEFT(first_name,1))||'.'|| last_name as full_name from customer

SELECT first_name || '.' || upper(RIGHT(last_name,1)) as FULL_name from customer

/* read postgres documentation for more detail */

