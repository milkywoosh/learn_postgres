/*
	note: this query using 
	data from "dvd_rental" database !
	so to use this query please make sure
	you have this database stored firstly
*/


/*
	nice reference to LEARN
	- https://www.freecodecamp.org/news/project-1-analyzing-dvd-rentals-with-sql-fd12dd674a64/
	- https://www.neilwithdata.com/join-using
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


/*
	JOIN payment with Customer ID
*/

SELECT p.customer_id, CONCAT(c.first_name, ' ' ,c.last_name) AS fullname, SUM(p.amount) as sum_payment_each_cust FROM payment as p
	LEFT JOIN customer as c ON c.customer_id = p.customer_id
	GROUP BY p.customer_id, CONCAT(c.first_name, ' ', c.last_name)
	ORDER BY SUM(p.amount) DESC;




/*
 CASTING DATA
*/
SELECT CAST(return_date-rental_date AS VARCHAR) FROM rental LIMIT 50; ---> casting data to string then later slice it	
