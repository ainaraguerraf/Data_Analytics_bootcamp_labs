#-----Get all the data from tables actor, film and customer.
USE sakila;
SELECT * 

FROM actor;

SELECT *
FROM film;

SELECT *
FROM customer; 

#-----Get film titles.
SELECT title
FROM film;

#-----Get unique list of film languages under the alias language. Note that we are not asking you to obtain the language per each film, but this is a good time to think about how you might get that information in the future.
SELECT DISTINCT name AS language
FROM language;
# English, Italian, Japanese, Mandarin, French

#-----A. Find out how many stores does the company have?
SELECT COUNT(DISTINCT store_id)
FROM store;
#only two

#-----B. Find out how many employees staff does the company have?
SELECT COUNT(DISTINCT staff_id)
FROM staff;
# 2 workers 

#-----C. Return a list of employee first names only?
SELECT DISTINCT first_name
FROM staff;
# Mike and Jon