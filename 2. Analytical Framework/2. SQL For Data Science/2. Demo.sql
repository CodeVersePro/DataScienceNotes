/* SELECT */
/* Basic Syntax for SELECT Statement
   SELECT column_name FROM table_name */
SELECT first_name FROM actor  #select statement to choose columns from table

SELECT first_name, last_name FROM actor #selecting multiple column

SELECT last_name, first_name FROM actor 

/* To select all the columns from a table
   SELECT * FROM Table_name */
SELECT * FROM actor 

/* DISTINCT */
/* Basic Syntax for DISTINCT Statement
   SELECT DISTINCT column_name FROM table_name */
SELECT * FROM film #selecting all columns

SELECT release_year FROM film # we got total 1000 rawas and some of them may be duplicate

SELECT DISTINCT release_year FROM film #geting dictinct values

SELECT DISTINCT(release_year) FROM film

SELECT DISTINCT rental_rate FROM film

/* COUNT */
/* Basic Syntax for COUNT Statement
   SELECT COUNT(column_name) FROM table_name */
/* COUNT is verry useful when combined with DISTINCT 
   SELECT COUNT(DISTNCT column_name) FROM table_name */
SELECT * FROM payment

SELECT COUNT(*) FROM payment

SELECT amount FROM payment

SELECT DISTINCT amount FROM payment

SELECT COUNT(DISTINCT amount) FROM payment

/* we use count to get number of items */

SELECT rental_duration FROM film

SELECT COUNT(rental_duration) from film # total rental_duration items

SELECT distinct rental_duration from film

SELECT COUNT(distinct rental_duration) from film #unique count

/* WHERE */
/* Basic syntax for WHERE Statement
   SELECT column 1, column 2
   FROM table
   WHERE conditions */

   
SELECT * FROM customer

SELECT * FROM customer
WHERE first_name = 'Jared'

SELECT * FROM film
WHERE rental_rate > 4 AND replacement_cost >= 19.99
AND rating = 'R'

SELECT COUNT(*) FROM film
WHERE rental_rate > 4 AND replacement_cost >= 19.99
AND rating = 'R'

SELECT * FROM film
WHERE rating = 'R' OR rating = 'PG-13'


SELECT * FROM film
WHERE rating != 'R'

SELECT * from film
WHERE rating != 'R' and rating != 'PG-13';
/* ORDER BY */
/* Basic Syntax for ORDER BY Statement
   SELECT column 1, column 2
   FROM table
   ORDER BY column 1 ASC/DESC */

SELECT * from film
WHERE rental_rate > 4
ORDER BY title asc

SELECT * from film
WHERE rental_rate > 4
ORDER BY title DESC

SELECT * from film
WHERE rental_rate > 2
ORDER BY title DESC, rental_rate ASC

SELECT * FROM customer
ORDER BY first_name

SELECT store_id,first_name,last_name FROM customer
ORDER BY store_id

SELECT store_id,first_name,last_name FROM customer
ORDER BY store_id,first_name

SELECT store_id,first_name,last_name FROM customer
ORDER BY store_id DESC,first_name ASC

/* LIMIT */
/* Basic Syntax for LIMIT Statement
   SELECT column 1 
   FROM table
   ORDER BY column 2 
   LIMIT n */

SELECT * FROM payment
LIMIT 1

SELECT * FROM payment
WHERE amount != 0
ORDER BY payment_date DESC
LIMIT 5

/* BETWEEN */

SELECT * FROM payment

SELECT * FROM payment
WHERE amount BETWEEN 2 AND 4
ORDER BY amount DESC

SELECT * FROM payment
WHERE amount BETWEEN 5 and 7

SELECT * FROM payment
WHERE amount not BETWEEN 5 and 7

SELECT * FROM payment
WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-15'

SELECT * FROM payment
WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-14'

/* IN */
/* Basic syntax of IN Statement
   SELECT column 1 
   FROM table
   WHERE column 1 IN (value 1, value 2) */
   
SELECT * FROM payment

SELECT DISTINCT amount FROM payment
ORDER BY amount

SELECT * FROM payment
WHERE amount IN(0.99,1.99,1.98)

SELECT * FROM customer
WHERE first_name IN('John','Jake','Julie')






  






