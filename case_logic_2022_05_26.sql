
SELECT 
CASE city
	WHEN 'Kabul' THEN 'okaay'
	WHEN 'Batna' THEN 'alritte'
	ELSE 'Nothing' 
END AS case_test, city

FROM city AS c
INNER JOIN country AS co ON c.country_id = co.country_id
WHERE c.city = 'Kabul' OR c.city = 'Batna';


SELECT city, COUNT(city) as sumcount FROM city 
GROUP BY city
ORDER BY sumcount DESC;



SELECT * FROM film
WHERE title LIKE '% Italian%';


Select name, 
CASE	WHEN name = 'English' THEN 'so so'
		ELSE 'normal'
END
from language;



