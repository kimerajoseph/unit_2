USE sakila;

SELECT * FROM sakila.store;
SELECT s.store_id,c.city,co.country FROM sakila.store s 
JOIN sakila.address a
ON s.address_id = a.address_id
JOIN sakila.city c 
ON a.city_id = c.city_id
JOIN sakila.country co 
USING (country_id)
;

select * from sakila.payment;
SELECT s.store_id,SUM(p.amount) AS revenue FROM sakila.store s 
JOIN sakila.customer c 
USING (store_id)
JOIN sakila.payment p 
ON c.customer_id = p.customer_id
GROUP BY s.store_id;

SELECT f.film_id,c.category_id,ca.name, AVG(f.length) AS category_length FROM sakila.film f
JOIN sakila.film_category c 
USING (film_id)
JOIN sakila.category ca 
ON c.category_id = ca.category_id
GROUP BY c.category_id
ORDER BY category_length DESC;

SELECT i.film_id,f.title,f.description, COUNT(f.film_id) AS frequency FROM sakila.rental r 
JOIN sakila.inventory i 
USING (inventory_id)
-- ON r.inventory_id = i.inventory_id
JOIN sakila.film f 
USING (film_id)
GROUP BY f.film_id
ORDER BY frequency DESC
;

SELECT c.category_id,ca.name AS genre, SUM(p.amount) AS genre_revenue FROM sakila.film f
JOIN sakila.film_category c 
USING (film_id)
JOIN sakila.category ca 
ON c.category_id = ca.category_id
JOIN sakila.inventory i 
USING (film_id)
JOIN sakila.rental r 
USING (inventory_id)
JOIN sakila.payment p
ON r.rental_id = p.rental_id
GROUP BY ca.name
ORDER BY genre_revenue DESC
LIMIT 5;

SELECT * FROM sakila.store s 
JOIN sakila.inventory i 
USING (store_id)
JOIN sakila.film f 
USING (film_id)
WHERE f.title = 'Academy Dinosaur' AND s.store_id = 1;

SELECT a.actor_id, ac.first_name, ac.last_name FROM sakila.film f 
JOIN sakila.film_actor a 
USING (film_id)
JOIN sakila.actor ac 
USING (actor_id)
WHERE f.film_id = a.film_id
GROUP BY f.title
;
-- select a.film_id, a.actor_id, b.actor_id

SELECT a.film_id, a.actor_id, b.actor_id FROM sakila.film_actor a
JOIN sakila.film_actor b 
ON a.actor_id <> b.actor_id AND a.film_id = b.film_id
;
-- GROUP BY a.film_id
-- WHERE a.film_id = b.film_id AND a.actor_id <> b.film_id
