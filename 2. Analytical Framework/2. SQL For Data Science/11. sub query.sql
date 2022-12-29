
SELECT * from film

SELECT round(AVG(rental_rate),2) from film

SELECT title, rental_rate from film
WHERE rental_rate > (SELECT avg(rental_rate) from film)

/* is it applying or not */

SELECT COUNT(*) from film

SELECT count(*) from film
WHERE rental_rate > (SELECT avg(rental_rate) from film)

/* yes its applying */

SELECT * from rental
WHERE return_date BETWEEN '2005-05-29' and '2005-05-30'

/* finding the film_id for above case */

SELECT film_id FROM rental
INNER JOIN inventory
on rental.inventory_id = inventory.inventory_id
WHERE rental.rental_date BETWEEN '2005-05-29' and '2005-05-30'

SELECT count(*) FROM rental
INNER JOIN inventory
on rental.inventory_id = inventory.inventory_id
WHERE rental.rental_date BETWEEN '2005-05-29' and '2005-05-30'

/* finding the title of the film for above film id */

SELECT title from film
WHERE film_id IN(SELECT film_id FROM rental
INNER JOIN inventory
on rental.inventory_id = inventory.inventory_id
WHERE rental.rental_date BETWEEN '2005-05-29' and '2005-05-30')
ORDER BY film_id DESC


/* above is the example of super subquery */

/* problem is to find first and last name of customer who have spent more then 11 dollers */

SELECT customer_id from payment
GROUP BY customer_id
HAVING sum(amount) > 11

SELECT customer.customer_id,first_name, last_name , sum(amount) FROM customer
inner JOIN payment
on customer.customer_id = payment.customer_id
GROUP BY customer.customer_id
HAVING customer.customer_id in (SELECT customer_id from payment
GROUP BY customer_id
HAVING sum(amount) > 11)


/* is it possible to do it simply bu inner join lets try */

select customer.customer_id,first_name, last_name, sum(amount) from customer
inner JOIN payment
on customer.customer_id = payment.customer_id
GROUP BY customer.customer_id
HAVING sum(amount) > 11




