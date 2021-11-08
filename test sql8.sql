USE sakila;
SELECT * FROM sakila.staff;
SELECT * FROM sakila.payment;
SELECT b.staff_id ,b.first_name, b.last_name,SUM(c.amount) AS amount_made FROM sakila.staff b 
INNER JOIN sakila.payment c 
ON b.staff_id = c.staff_id
WHERE payment_date LIKE '%2005-08%'
GROUP BY b.staff_id;
-- ORDER BY c.amount_made DESC;
-- , SUM(c.amount) AS amount_made
SELECT * FROM sakila.payment WHERE payment_date LIKE '%2005-08%' AND staff_id = 2;


SELECT a.actor_id, b.first_name, b.last_name, COUNT(b.actor_id) AS movies_acted FROM film_actor a
JOIN ACTOR b
ON a.actor_id = b.actor_id
JOIN film c 
ON c.film_id = a.film_id
GROUP BY a.actor_id
ORDER BY movies_acted DESC
LIMIT 5;

SELECT c.customer_id,c.first_name,c.last_name,COUNT(r.customer_id) AS rent_times FROM sakila.customer c
JOIN sakila.rental r
ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY rent_times DESC
LIMIT 5;
SELECT * FROM sakila.rental;
SELECT s.staff_id, s.first_name, s.last_name, s.address_id,a.address FROM sakila.staff s 
JOIN sakila.address a 
ON a.address_id = s.address_id;

SELECT  COUNT(DISTINCT film_id) FROM sakila.film;
SELECT f.film_id,f.title, COUNT(fa.actor_id) AS actors FROM sakila.film f 
JOIN sakila.film_actor fa
ON f.film_id = fa.film_id
GROUP BY f.film_id
ORDER BY actors DESC;

SELECT c.customer_id, c.last_name,c.first_name, SUM(p.amount) AS total_paid FROM sakila.customer c
JOIN sakila.payment p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY c.last_name;