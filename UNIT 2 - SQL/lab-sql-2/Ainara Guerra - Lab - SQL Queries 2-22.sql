USE sakila;

#-----Select all the actors with the first name ‘Scarlett’.
SELECT first_name
FROM actor
WHERE first_name = 'Scarlett';
#Two actors named Scarlett 

#-----Select all the actors with the last name ‘Johansson’.
SELECT last_name
FROM actor
WHERE last_name = 'Johansson';
#Three actors with the last name as Johansson 

#-----How many films (movies) are available for rent?
#If we have considered all the films 
SELECT COUNT(DISTINCT rental_id)
FROM rental;
#16044

#-----How many films have been rented?
SELECT COUNT(DISTINCT film_id)
FROM film
WHERE rental_duration >0;
#1000

#-----What is the shortest and longest rental period?
SELECT min(rental_duration), max(rental_duration)
FROM film;
# minimun: 3	max: 7

#-----What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT min(length) AS min_duration, max(length) AS max_duration
FROM film;
# minimun: 46	max: 185

#-----What's the average movie duration?
SELECT AVG(length)
FROM film;
# avg = 115.2720

#-----What's the average movie duration expressed in format (hours, minutes)?
SELECT AVG(length)/60
FROM film;
# avg = 1.9 hours 

#or: 

SELECT  AVG(length) / 60 AS hours, AVG(length) % 60 AS minutes
FROM film;
# hours: 1,9 ; minutes: 55,22

#or: 
SELECT  ROUND(AVG(length) / 60, 0) AS hours, ROUND(AVG(length) % 60, 0) AS minutes
FROM film;

#-----How many movies longer than 3 hours?
SELECT COUNT(DISTINCT film_id)
FROM film
WHERE length > 180;
# 39 movies

#-----Get the name and email formatted. Example: Mary SMITH - mary.smith@sakilacustomer.org.
SELECT CONCAT(LOWER(First_name)," ", last_name, " - ", email) AS customer_info
FROM customer
LIMIT 5;


#-----What's the length of the longest film title?
SELECT MAX(LENGTH(title))
FROM film;
# The longest length is 27.