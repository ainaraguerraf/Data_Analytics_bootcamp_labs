# 1. In the table actor, which are the actors whose last names are not repeated? 
# For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. 
#These three actors have the same last name. So we do not want to include this last name in our output. 
# Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.
USE sakila;
SELECT last_name, count(last_name) AS unique_last_name
FROM actor
GROUP BY last_name
HAVING unique_last_name = 1;

# 2. Which last names appear more than once? 
# We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once.
SELECT last_name, count(last_name) AS Not_unique_last_name
FROM actor
GROUP BY last_name
HAVING Not_unique_last_name > 1;
# 55 last_names detected.

# 3. Using the rental table, find out how many rentals were processed by each employee.
SELECT staff_id, count(rental_id) AS total_rentals_processed
FROM rental
GROUP BY staff_id;
# 1: 8041; 2: 8004

# 4. Using the film table, find out how many films were released each year.
SELECT release_year, count(film_id) AS total_films_each_year
FROM film
GROUP BY release_year;
#2006: 1000

# 5. Using the film table, find out for each rating how many films were there.
select rating, count(film_id) as total_films_each_rating
from film
group by rating;
# PG: 194; G:178; NC-17:210; PG-13:223; R:195

# 6. What is the mean length of the film for each rating type. Round off the average lengths to two decimal places.
SELECT ROUND(AVG(length),2) AS Rounded_length
FROM film;
# 115,27

# 7. Which kind of movies (rating) have a mean duration of more than two hours?
SELECT  rating, ROUND(AVG(length),2) AS Rounded_length
FROM film
GROUP BY rating
HAVING Rounded_length>120;
#PG-13: 120,44