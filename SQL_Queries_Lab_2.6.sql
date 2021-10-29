USE sakila;

-- QUESTION 1
-- In the table actor, which are the actors whose last names are not repeated?
SELECT
	first_name, last_name
FROM 
	sakila.actor
group by last_name
HAVING count(DISTINCT first_name) = 1;

-- QUESTION 2
-- Which last names appear more than once?
SELECT 
	last_name , COUNT(first_name) AS name_count 
FROM
	sakila.actor
group by last_name
HAVING count(DISTINCT first_name) > 1;

-- QUESTION 3
-- Using the rental table, find out how many rentals were processed by each employee.
SELECT 
	staff_id, COUNT(*) 
FROM 
	sakila.rental
GROUP BY staff_id;

-- QUESTION 6
-- Using the film table, find out how many films were released each year.
SELECT 
	release_year, COUNT(release_year) AS movie_count 
FROM 
	sakila.film
GROUP BY release_year;
-- SELECT release_year FROM sakila.film WHERE release_year <> 2006;

-- QUESTION 7
-- Using the film table, find out for each rating how many films were there.
SELECT 
	rating, COUNT(rating) AS rating_total 
FROM
	sakila.film
GROUP BY rating;

-- QUESTION 8
-- What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
SELECT 
	rating, ROUND(AVG(length),2) AS avg_length 
FROM 
	sakila.film
GROUP BY rating;

-- QUESTION 9
-- Which kind of movies (rating) have a mean duration of more than two hours?
SELECT
	rating, AVG(length) AS avg_length 
FROM
	sakila.film
GROUP BY rating
HAVING avg_length > 120;

-- QUESTION 10
-- Rank films by length (filter out the rows that have nulls or 0s in length column). 
-- In your output, only select the columns title, length, and the rank.
SELECT 
	title, length 
FROM
	sakila.film
GROUP BY length DESC
HAVING length <> 0 OR NULL;
