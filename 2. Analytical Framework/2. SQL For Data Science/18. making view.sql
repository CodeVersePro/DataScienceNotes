
/* we can use view to make virtual tables for easy application and avoid repitative task*/

/*lets for example we want to calculate average rating of top ten imdb movies, we do not need
to extract top 10 movies every time but we can store them in virtual table and use whenever neede */

SELECT * FROM customer
SELECT * from address

/*extracting customer adress and store as ciew */

SELECT first_name,last_name,address from customer
INNER JOIN address
on customer.address_id = address.address_id

/* we can use create view argument */

CREATE VIEW Customer_address_info AS
SELECT first_name,last_name,address from customer
INNER JOIN address
on customer.address_id = address.address_id

/* how to replace view*/

CREATE OR REPLACE VIEW customer_address_info AS
SELECT first_name,last_name,address,district from customer
INNER JOIN address
on customer.address_id = address.address_id


