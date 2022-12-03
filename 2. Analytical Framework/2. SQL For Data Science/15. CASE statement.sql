
SELECT * from payment

SELECT * from customer

/* now lets learn how to use case statement */

/* Case is to be placed before from */

select customer_id,
CASE

    WHEN (customer_id <= 100) THEN 'Premium'
    WHEN (customer_id BETWEEN 101 and 200) Then 'Plus'
    Else 'Normal'

END As customer_class
from customer


/* CASE general expression */

SELECT customer_id,
CASE customer_id
    When 2 then 'Winner'
    when 5 then 'Second'
    else 'loose'
END as lottery
from customer

 /* findig sum of movies rentaed for 0.99 , 2.99 and 4.99 */

 select * from film

 SELECT sum(
    CASE

        when (rental_rate = 0.99) then 1
        ELSE 0
    END
 ) as BARGAIN,

SUM(

    CASE
        WHEN (rental_rate = 2.99) THEN 1
        ELSE 0
    END

) AS REGULAR,

SUM(

    CASE
        WHEN (rental_rate = 4.99) THEN 1
        ELSE 0
    END
) AS premium,

SUM (

    CASE
        WHEN (rental_rate != 0 ) THEN 1
        ELSE 0
    END
) AS TOTAL
FROM film


/* solving above challenge with group by */

SELECT rental_rate, COUNT(rental_rate) from film
GROUP BY rental_rate
