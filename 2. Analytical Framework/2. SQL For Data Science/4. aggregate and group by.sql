/* using like and ilike with wild card % and _*/

SELECT * from city

/* like is case sensetive*/

SELECT city FROM city
WHERE city LIKE 'b%'

/* i like is not case sensitive*/

SELECT city FROM city
WHERE city LIKE 'B%'

/*using wild card __ to specify length */

SELECT city FROM city
WHERE city LIKE 'B___'

SELECT city FROM city
WHERE city LIKE '%h%'

SELECT * from customer

SELECT * FROM customer
WHERE first_name ilike 'a%' and last_name ilike 'a%'


/* AGREGATION CALCULATION sum,min,max avg */

SELECT * FROM film

SELECT SUM(replacement_cost) FROM film

SELECT MIN(replacement_cost) FROM film

SELECT MAX(replacement_cost) from film

SELECT AVG(replacement_cost) from film

/* Rounding off*/

SELECT round(avg(replacement_cost),2) FROM film

SELECT MAX(replacement_cost), MIN(replacement_cost) FROM film

SELECT SUM(replacement_cost) FROM film


/* group by */

SELECT * FROM payment

SELECT customer_id, SUM(amount) from payment
GROUP BY customer_id
ORDER BY sum(amount) ASC

SELECT DATE(payment_date), SUM(amount) FROM payment
GROUP BY DATE(payment_date)
ORDER BY SUM(amount) DESC

SELECT DATE(payment_date), COUNT(amount) FROM payment
GROUP BY DATE(payment_date)
ORDER BY SUM(amount) DESC


/* apply where statement in group by*/

SELECT * FROM payment

SELECT customer_id, SUM(amount) FROM payment /*apply where on not aggregate with where */
WHERE customer_id IN (184,87,477)
GROUP BY customer_id

/* on applying ggregate */

SELECT customer_id, SUM(amount) FROM payment 
WHERE customer_id IN (184,87,477)
GROUP BY customer_id
HAVING sum(amount) > 100
ORDER BY SUM(amount) DESC

/* as query for aliasing columns */

SELECT customer_id as CustomerID from payment

SELECT count(*) as TOTALRAWS from payment

SELECT customer_id as CID, amount as SPENt FROM payment /* for multiple raws */

SELECT customer_id AS CustomID, SUM(amount) AS Total_Spent FROM payment 
WHERE customer_id IN (184,87,477)
GROUP BY customer_id
HAVING sum(amount) > 100
ORDER BY SUM(amount) DESC