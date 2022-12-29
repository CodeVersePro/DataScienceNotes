/* how to make inner join */

SELECT * from film

SELECT * FROM film
WHERE length = 117

SELECT film1.title, film1.length, film2.title from film as film1
INNER JOIN film as film2
on film1.film_id != film2.film_id
WHERE film1.length = film2.length 
ORDER BY film1.title