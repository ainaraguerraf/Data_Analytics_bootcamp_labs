 # SQL SELF CROSS JOINS | AINARA GUERRA
USE sakila; 
# Is an exercise
# ---- Is a comment 

# --------------------------------------------------------------------

# 1 Get all pairs of actors that worked together. self join

# ----- with self joins
SELECT  fa1.film_id, fa1.actor_id, fa2.actor_id
FROM film_actor fa1
JOIN film_actor fa2
ON fa1.film_id = fa2.film_id
WHERE fa1.actor_id != fa2.actor_id
LIMIT 100; # If I don't put a limit it doesn't work :(

#  ----- with names and last names of the actors.
SELECT distinct fa1.film_id, a1.first_name, a1.last_name, a2.first_name, a2.last_name
FROM film_actor fa1
JOIN actor a1 
ON fa1.actor_id = a1.actor_id
JOIN film_actor fa2 
ON fa1.film_id = fa2.film_id AND fa1.actor_id < fa2.actor_id
JOIN actor a2 
ON fa2.actor_id = a2.actor_id
ORDER BY a1.last_name, a2.last_name;
# --- used the < condition to ensure that each pair of actors is listed only once.


# 2 Get all pairs of customers that have rented the same film more than 3 times.

# ---- With self join
SELECT  r1.inventory_id, r1.customer_id, r2.customer_id, count(*) num_rentals
FROM rental r1
JOIN rental r2
ON r1.inventory_id = r2.inventory_id
GROUP BY r1.customer_id, r2.customer_id, r1.inventory_id
HAVING num_rentals > 2;
# doesn't work...

# ---- Other option explained by Xisca:
SELECT i.film_id, r1.customer_id customer_1, r2.customer_id customer_2, count(*) num_rentals
from rental r1
join rental r2
ON r1.inventory_id = r2.inventory_id
INNER JOIN inventory i
ON r2.inventory_id = i.inventory_id
GROUP BY i.film_id, r1.customer_id, r2.customer_id
HAVING COUNT(*)>2;

# 3 Get all possible pairs of actors and films. 

# ---- using cross joins
SELECT distinct(a.actor_id), a.first_name, a.last_name, fa.film_id, f.title
FROM film_actor fa
CROSS JOIN actor a
JOIN film f ON fa.film_id = f.film_id
ORDER BY fa.film_id, a.actor_id;


