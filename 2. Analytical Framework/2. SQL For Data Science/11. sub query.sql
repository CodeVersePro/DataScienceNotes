
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


/* above is the example of super subquery */
