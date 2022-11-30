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