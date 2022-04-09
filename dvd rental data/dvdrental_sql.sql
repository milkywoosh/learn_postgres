/*
    category, film_category, film, language, film_actor, actor, store
    staff, payment, rental, inventory, customer, address, city, country
*/

SELECT * FROM film_category AS fc
INNER JOIN film AS f
    ON fc.film_id = f.film_id
WHERE f.rental_rate = 

/*
table_schema  table_name,

"public"	"actor_info"
"public"	"customer_list"
"public"	"film_list"
"public"	"nicer_but_slower_film_list"
"public"	"sales_by_film_category"
"public"	"sales_by_store"
"public"	"staff_list"
"public"	"sum_amount_cust"
*/

SELECT CONCAT(first_name, ' ', last_name) as full_name, email, address_id FROM  customer
WHERE  CONCAT(first_name, ' ', last_name) = 'Nancy Thomas';


SELECT first_name, COUNT(first_name) count_fname FROM customer
GROUP BY first_name
HAVING COUNT(first_name) > 1;

-- check sum of total of each customer group by id??
SELECT customer_id, SUM(amount) AS amount_sum FROM payment
WHERE customer_id = 148
GROUP BY customer_id;

-- EXPORT TO EXCEL As CSV --> USE ;  AS DELIMITER
COPY (SELECT CONCAT(c.first_name, ' ', c.last_name), sac.sum_amount FROM customer AS c
INNER JOIN sum_amount_cust AS sac
ON c.customer_id = sac.customer_id)
TO '/Users/macbook/learn_postgres/dvd rental data/sum_cust_payment1.csv'
DELIMITER ';' CSV HEADER;
-- note: DELIMITER should use ';' to enable mapping to excel file



