USE sakila;

-- QUESTION 1
-- SELECT name, COUNT(*) FROM sakila.category
-- GROUP BY name;
SELECT 
	c.name, COUNT(*) AS film_count 
FROM
	sakila.film_category b
	INNER JOIN sakila.category c 
		ON b.category_id = c.category_id
INNER JOIN 
	sakila.film d
		ON b.film_id = d.film_id
GROUP BY c.name
ORDER BY film_count DESC;

-- QUESTION 2
SELECT 
	b.staff_id ,b.first_name, b.last_name,SUM(c.amount) AS amount_made 
FROM 
	sakila.staff b 
INNER JOIN 
	sakila.payment c 
		ON b.staff_id = c.staff_id
WHERE payment_date LIKE '%2005-08%'
GROUP BY b.staff_id;

-- QUESTION 3
SELECT 
	a.actor_id, b.first_name, b.last_name, COUNT(b.actor_id) AS movies_acted 
FROM 
	sakila.film_actor a
	JOIN sakila.actor b
		ON a.actor_id = b.actor_id
	JOIN sakila.film c 
		ON c.film_id = a.film_id
GROUP BY a.actor_id
ORDER BY movies_acted DESC
LIMIT 5;

-- QUESTION 4
SELECT 
	c.customer_id,c.first_name,c.last_name,COUNT(r.customer_id) AS rent_times 
FROM 
	sakila.customer c
	JOIN 
    sakila.rental r
		ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY rent_times DESC
LIMIT 5;

-- QUESTION 5
SELECT 
	s.staff_id, s.first_name, s.last_name, s.address_id,a.address 
FROM 
	sakila.staff s 
	JOIN sakila.address a 
		ON a.address_id = s.address_id;

-- QUESTION 6
SELECT 
	f.film_id,f.title, COUNT(fa.actor_id) AS actors 
FROM
	sakila.film f 
	JOIN 
    sakila.film_actor fa
		ON f.film_id = fa.film_id
GROUP BY f.film_id
ORDER BY actors DESC;

-- QUESTION 7
SELECT 
	c.customer_id, c.last_name,c.first_name, SUM(p.amount) AS total_paid 
FROM 
	sakila.customer c
	JOIN sakila.payment p
		ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY c.last_name;

-- QUESTION 8
SELECT 
	c.name AS film_category, COUNT(*) AS film_count 
FROM
	sakila.film_category b
	INNER JOIN sakila.category c 
		ON b.category_id = c.category_id
INNER JOIN 
	sakila.film d
		ON b.film_id = d.film_id
GROUP BY c.name
ORDER BY film_count DESC;