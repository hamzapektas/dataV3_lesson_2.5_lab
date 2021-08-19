USE sakila;
-- 1 Select all the actors with the first name ‘Scarlett’.

SELECT * FROM sakila.actor;
SELECT * FROM sakila.actor
WHERE first_name = 'SCARLETT';

-- 2 How many films (movies) are available for rent and how many films have been rented?

SELECT * FROM sakila.rental;
SELECT rental_id, count((return_date - rental_date)>0) AS 'Availables'
FROM sakila.rental; 

-- 3 What are the shortest and longest movie duration? Name the values max_duration and min_duration.

SELECT * FROM sakila.film;
SELECT title, MAX(length) AS 'max_duration' FROM sakila.film;
SELECT title, MIN(length) AS 'min_duration'FROM sakila.film;

-- 4 What's the average movie duration expressed in format (hours, minutes)?
SELECT * FROM sakila.film;
SELECT title, sec_to_time(AVG(length)*60) AS 'average' FROM sakila.film;

-- 5 How many distinct (different) actors' last names are there?

SELECT * FROM sakila.actor;
SELECT COUNT(DISTINCT last_name) FROM sakila.actor;

-- 6 Since how many days has the company been operating (check DATEDIFF() function)?
 
SELECT * FROM sakila.payment
order by payment_date desc;
SELECT  DATEDIFF('2006-02-14 15:16:03','2005-05-24 22:53:30');
SELECT datediff(max(rental_date), min(rental_date))
FROM rental;


-- 7 Show rental info with additional columns month and weekday. Get 20 results.

SELECT * FROM sakila.rental;
SELECT *, DATE_FORMAT(last_update, ‘%m’) AS 'month' FROM sakila.rental
limit 20;
select *, date_format(convert(rental_date,date), '%M') as 'month' 
from rental
limit 20;
select *, date_format(convert(rental_date,date), '%W') as 'Week' 
from rental
limit 20;

-- 8 Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

SELECT *,
CASE WHEN dayname(rental_date) IN ('Saturday', 'Sunday') THEN 'weekend'
ELSE 'workday'
END AS day_type
FROM rental;

-- 9 Get release years.

SELECT * FROM sakila.film;
SELECT title, release_year FROM sakila.film;

-- 10 Get all films with ARMAGEDDON in the title.

SELECT *
FROM sakila.film
WHERE title LIKE '%armageddon%';

-- 11 Get all films which title ends with APOLLO.

SELECT *
FROM sakila.film
WHERE title LIKE '%APOLLO';

-- 12 Get 10 the longest films.

SELECT title, length FROM sakila.film
ORDER BY length DESC
LIMIT 10;

-- 13 How many films include Behind the Scenes content?

SELECT * FROM sakila.film;
SELECT count(*)
FROM sakila.film
WHERE special_features LIKE '%Behind the Scenes%';
