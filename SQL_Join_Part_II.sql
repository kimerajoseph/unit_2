USE sakila;

-- QUESTION 1
SELECT
	s.store_id,c.city,co.country 
FROM 
	sakila.store s 
	JOIN 
    sakila.address a
		ON s.address_id = a.address_id
	JOIN sakila.city c 
		USING (city_id)
	JOIN sakila.country co 
		USING (country_id)
;

-- QUESTION 2
SELECT
	s.store_id,SUM(p.amount) AS revenue 
FROM 
	sakila.store s 
	JOIN 
		sakila.customer c 
		USING (store_id)
	JOIN 
		sakila.payment p 
		ON c.customer_id = p.customer_id
GROUP BY s.store_id;

-- QUESTION 3
SELECT 
	f.film_id,c.category_id,ca.name, AVG(f.length) AS category_length 
FROM 
	sakila.film f
	JOIN 
		sakila.film_category c 
		USING (film_id)
	JOIN 
		sakila.category ca 
		ON c.category_id = ca.category_id
GROUP BY c.category_id
ORDER BY category_length DESC;

-- QUESTION 4
SELECT 
	i.film_id,f.title,f.description, COUNT(f.film_id) AS frequency 
FROM 
	sakila.rental r 
	JOIN 
		sakila.inventory i 
		USING (inventory_id)
	JOIN 
		sakila.film f 
		USING (film_id)
GROUP BY f.film_id
ORDER BY frequency DESC
;

-- QUESTION 5
SELECT 
	c.category_id,ca.name AS genre, SUM(p.amount) AS genre_revenue 
FROM
	sakila.film f
	JOIN 
		sakila.film_category c 
		USING (film_id)
	JOIN 
		sakila.category ca 
		ON c.category_id = ca.category_id
	JOIN 
		sakila.inventory i 
		USING (film_id)
	JOIN 
		sakila.rental r 
		USING (inventory_id)
	JOIN 
		sakila.payment p
		ON r.rental_id = p.rental_id
GROUP BY ca.name
ORDER BY genre_revenue DESC
LIMIT 5;

-- QUESTION 6
-- DESIGNED QUERRY TO JOIN MULTIPLE TABLE AND CHECK MOVIEW NAME AND STORE ID
-- IF QUERRY RETURNS RESULTS, THEN ITS AVAILABLE. IF NOT, THEN THE STORE DOES NOT RENT OUT THAT MOVIE
SELECT * FROM sakila.store s 
	JOIN 
		sakila.inventory i 
		USING (store_id)
	JOIN 
		sakila.film f 
		USING (film_id)
WHERE f.title = 'Academy Dinosaur' AND s.store_id = 1;
