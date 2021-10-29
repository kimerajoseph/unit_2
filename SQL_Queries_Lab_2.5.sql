USE sakila;

-- QUESTION 1
-- Select all the actors with the first name ‘Scarlett’
SELECT * 
FROM 
	sakila.actor 
WHERE 
	first_name = 'Scarlett';

-- QUESTION 2    
-- How many films (movies) are available for rent and how many films have been rented
SELECT
	COUNT(DISTINCT inventory_id) AS available_movies, COUNT(rental_id) AS rented 
FROM
	sakila.rental;

-- QUESTION 3
-- What are the shortest and longest movie duration? Name the values max_duration and min_duration
SELECT 
	max(length) AS max_duration, min(length) AS min_duration 
FROM
	sakila.film;

-- QUESTION 4
-- What's the average movie duration expressed in format (hours, minutes)?
SELECT 
	floor(AVG(film.length)/60) as hours, floor(AVG(film.length)%60) as minutes 
FROM 
	sakila.film ;

-- QUESTION 5
-- How many distinct (different) actors' last names are there?
SELECT 
	COUNT(DISTINCT last_name) 
FROM
	actor;

-- QUESTION 6
-- Since how many days has the company been operating (check DATEDIFF() function)
-- USING THE RENATAL TABLE 
SELECT 
	datediff(max(rental_date), min(rental_date))
FROM 
	sakila.rental;

-- QUESTION 7
-- Show rental info with additional columns month and weekday. Get 20 results.
SELECT *,
	dayofweek(rental_date) AS week_day, monthname(rental_date) AS month  
FROM 
	sakila.rental LIMIT 20;
    
-- QUESTION 8
-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *,CASE
	WHEN dayofweek(rental_date) > 5 THEN 'weekend' ELSE 'workday'  END AS day_type
FROM 
	sakila.rental;

-- QUESTION 9
-- Get release years.
SELECT 
	film_id, title, release_year 
FROM
	sakila.film;
    
-- QUESTION 10   
-- Get all films with ARMAGEDDON in the title.
SELECT * 
FROM 
	sakila.film 
WHERE 
	title LIKE '%ARMAGEDDON%';

-- QUESTION 11     
-- Get all films which title ends with APOLLO.
SELECT * 
FROM 
	sakila.film 
WHERE 
	title LIKE '%APOLLO';

-- QUESTION 12
-- Get 10 the longest films.
SELECT film_id, title, length 
FROM 
	sakila.film 
ORDER BY length LIMIT 10;

-- QUESTION 13
-- How many films include Behind the Scenes content
SELECT
	COUNT(*) 
FROM 
	sakila.film 
WHERE 
	special_features LIKE '%%Behind the Scenes%%'