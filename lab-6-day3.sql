--- lab-6
--- 1-In the table actor, which are the actors whose last names are not repeated? 
use sakila;
SELECT DISTINCT last_name
FROM actor
WHERE last_name NOT IN (
    SELECT last_name
    FROM actor
    GROUP BY last_name
    HAVING COUNT(*) = 1
)
ORDER BY last_name;

SELECT last_name
FROM actor
GROUP BY last_name
HAVING COUNT(*) > 1
ORDER BY last_name;
SELECT last_name FROM sakila.actor
GROUP BY last_name
HAVING count(*) =1;

-- Using the rental table, find out how many rentals were processed by each employee
select * from rental;
select sum(rental_id) as nu_rental,staff_id
from rental
group by staff_id;
-- 4-Using the film table, find out how many films were released each year.
select * from film;

select sum(film_id),release_year
from film
group by release_year;
--- 5 Using the film table, find out for each rating how many films were there.
SELECT Rating, COUNT(*) AS Number_of_Films
FROM film
GROUP BY Rating;

-- 6-What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
select rating, round(avg(length),2) as 'mean_length'
from film
group by rating;

-- 7-Which kind of movies (rating) have a mean duration of more than two hours?
SELECT Rating, AVG(Length) AS Mean_Length
FROM film
GROUP BY Rating
HAVING Mean_Length > 120;
-- 8-Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank
SELECT Title, Length, RANK() OVER (ORDER BY Length DESC) AS 'Rank'
FROM film
WHERE Length IS NOT NULL AND Length > 0;