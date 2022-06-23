/*
	note: this query using 
	data from "dvd_rental" database !
	so to use this query please make sure
	you have this database stored firstly
*/

SELECT SUM(amount) AS total_amount_rental 
FROM rental_price;

SELECT DISTINCT(customer_id) AS unique_cust_id from payment
ORDER BY customer_id DESC;

/*check total spent each customer_id !*/
SELECT customer_id, SUM(amount) AS total_spent_each_cust
FROM payment
GROUP BY customer_id
ORDER BY total_spent_each_cust DESC



SELECT customer_id, SUM(amount) AS total_spent_each_cust
FROM payment
GROUP BY customer_id
HAVING SUM(amount) >= 100
ORDER BY SUM(amount) DESC;

