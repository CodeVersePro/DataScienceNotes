
/* return the customer id who have spent atleast $11* ans staff member id 2 */

SELECT customer_id FROM payment
WHERE amount >= 11 and staff_id = 2

/* how many films start with letter j*/

SELECT COUNT(*) from film
WHERE left(title,1) = 'J'

/* alternative way fro above problem */

SELECT COUNT(*) FROM film
WHERE title LIKE 'J%'

/* what customer has the highest customer id whose name start with 'E' and has address id lower then 500 */

select * from customer
WHERE left(first_name,1) = 'E' and address_id < 500