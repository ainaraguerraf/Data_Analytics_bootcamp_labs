# Get film ratings.
use sakila;
select distinct rating
from film;
# PG, G. NC-17, PG-13, R

# Get release years.
select distinct release_year
from film;
# 2006

# Get all films with ARMAGEDDON in the title.
select distinct film_id, title
from film
where title regexp "ARMAGEDDON";

# Get all films with APOLLO in the title
select distinct film_id, title
from film
where title regexp "APOLLO";

# Get all films which title ends with APOLLO.

select distinct film_id, title
from film
where title regexp "APOLLO$";

# Get all films with word DATE in the title.
select distinct film_id, title
from film
where title regexp "DATE";

# Get 10 films with the longest title.
SELECT film_id, title, length(title) as length_of_title
FROM film
order by length(title) desc;

# Get 10 the longest films.
SELECT film_id, title, `length`
FROM film
order by `length` desc
LIMIT 10;

# How many films include Behind the Scenes content?
SELECT * 
FROM film
WHERE special_features regexp "behind the scenes";
# 538 rows

# List films ordered by release year and title in alphabetical order.
SELECT release_year, title
FROM film
order by release_year, title;
