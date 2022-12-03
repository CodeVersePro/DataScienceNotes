
/* lets first create table fro practicing it */

CREATE Table Price (

    price_id SERIAL PRIMARY KEY,
    price_og INTEGER NOT NULL,
    discount INTEGER CHECK (discount > 0)


)

INSERT INTO price(price_og,discount)
values (100,20)

INSERT INTO price(price_og)
values (200)

INSERT INTO price(price_og,discount)
values (300,30)

INSERT INTO price(price_og,discount)
values (400,40)

INSERT INTO price(price_og)
values (500)


SELECT * FROM PRICE


/* our task is to find final price */

SELECT price_og, discount , (price_og - discount) as final_price from price /* it will not return final price of 2 */

/*solving abouve problem using COALSACE*/

SELECT price_og,discount, (price_og - COALESCE(discount,0)) as Final_price from price


/* using cast for reasonable data type conversion */

SELECT cast('5' as INTEGER) as demo /* converted to int */

SELECT cast(6 as CHAR) as chart

/* other synatx */

Select 5383 :: CHAR

Select '8383' :: INT

