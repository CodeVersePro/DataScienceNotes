
/* Inner JOInt for Intersection */

SELECT * from customer

SELECT * FROM payment

SELECT customer.customer_id, first_name, last_name, amount from customer
INNER JOIN payment
on customer.customer_id = payment.customer_id

SELECT customer.customer_id, first_name, last_name, sum(amount) as total_spent from customer
INNER JOIN payment
on customer.customer_id = payment.customer_id
GROUP BY customer.customer_id
ORDER BY SUM(amount) DESC

SELECT customer.customer_id, first_name, last_name, sum(amount) as total_spent from customer
INNER JOIN payment
on customer.customer_id = payment.customer_id
GROUP BY customer.customer_id
HAVING SUM(amount) > 200
ORDER BY SUM(amount) DESC


/* Full outer JOIN for union */

select customer.customer_id,payment_id, first_name, last_name, amount from payment
FULL OUTER JOIN customer
ON customer.customer_id = payment.customer_id


select customer.customer_id,payment_id, first_name, last_name, amount from payment
FULL OUTER JOIN customer
ON customer.customer_id = payment.customer_id
WHERE customer.customer_id  is NULL or payment.payment_id is NULL

/* ther are no customer with 0 payment  confirming it*/

SELECT COUNT(distinct customer_id) from customer
SELECT COUNT(distinct customer_id) FROM payment



/* Left outer join*/

SELECT film.film_id, inventory_id, title, store_id from film
LEFT OUTER JOIN inventory
ON film.film_id = inventory.film_id
WHERE inventory.inventory_id is NULL