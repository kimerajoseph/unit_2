USE sakila;

-- QUESTION 1
-- Review the tables in the database
SHOW tables;
SELECT 
	count(*) AS TOTALNUMBEROFTABLES
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'sakila';


-- QUESTION 2
-- Explore tables by selecting all columns from each table or using the in built review features for your client
SELECT * FROM sakila.staff;
SELECT * FROM sakila.film;

-- DO THE SAME FOR ALL 23 TABLES IN THE DATABASE

-- QUESTION 3
SELECT title FROM sakila.film;

-- QUESTION 4
-- Select one column from a table and alias it. Get unique list of film languages under the alias language
SELECT 
	film_id, title, language_id,  name AS movie_language 
FROM 
	sakila.film f 
	JOIN 
		sakila.language l 
		USING (language_id);

-- SELECT * FROM sakila.language WHERE name <> 'English';

-- QUESTION 5.1
-- Find out how many stores does the company have
SELECT 
	COUNT(DISTINCT store_id) AS no_of_stores 
FROM
	sakila.inventory;

-- QUESTION 5.2
-- Find out how many employees staff does the company have
SELECT 
	COUNT(DISTINCT staff_id) AS no_of_staff 
FROM
	sakila.staff;

-- QUESTION 5.3
-- Return a list of employee first names only
SELECT first_name FROM sakila.staff;