
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

