# LAB SQL SUBQUERIES | Ainara Guerra
use sakila;
# Is the title of the exercise
#----- is a comment


# -----------------------------------------------------
# 1 How many copies of the film Hunchback Impossible exist in the inventory system?
SELECT COUNT(film_id) total_copies_HI
FROM INVENTORY
WHERE film_id = (SELECT film_id 
				FROM film 
				WHERE title = "Hunchback Impossible"
)
;
#-----6 copies

# 2 List all films whose length is longer than the average of all the films

SELECT title, film_id, length
FROM film
WHERE length > (SELECT AVG(length) 
				FROM film)
ORDER BY length;

# 3 Use subqueries to display all actors who appear in the film Alone Trip.

SELECT a.actor_id, a.first_name, a.last_name
FROM actor a
LEFT JOIN film_actor fa
ON a.actor_id = fa.actor_id
WHERE fa.film_id = (SELECT film_id
				  FROM film
                  WHERE title = "Alone Trip"
)
;
# 8 actors returned

# 4 Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.

select distinct(name)
from category; # "Family" category

SELECT f.film_id, f.title
FROM f.film
LEFT JOIN film_category fc
USING (film_id)
WHERE fc.category = (SELECT category_id
					FROM category
                    WHERE name = "family"
)
;

# 5 Get name and email from customers from Canada using subqueries. Do the same with joins. Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.
SELECT c.first_name Name, c.email Email
FROM customer c
LEFT JOIN address a
USING (address_id)
JOIN city ci
USING (city_id)
WHERE ci.city_id = (SELECT city_id
					FROM country
                    WHERE country = "Canada"
)
;

# 6 Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number of films. First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.
SELECT f.title "Films with prolific actors"
FROM film f
JOIN film_actor  fa
USING (film_id)
JOIN actor a 
USING (actor_id) 
WHERE a.actor_id = (
    SELECT actor_id
    FROM (
        SELECT actor_id, COUNT(*) AS num_films
        FROM film_actor
        GROUP BY actor_id
        ORDER BY num_films DESC
        LIMIT 1) actor_films
)
;

# 7 Films rented by most profitable customer. You can use the customer table and payment table to find the most profitable customer ie the customer that has made the largest sum of payments

SELECT f.title "Films rented by most profitable customer"
FROM film f
LEFT JOIN inventory i
USING (film_id)
JOIN rental r
USING (inventory_id)
WHERE r.customer_id = (SELECT customer_id
						FROM (
                        SELECT customer_id, COUNT(*) AS num_rented
						FROM rental
						GROUP BY customer_id
						ORDER BY num_rented
						LIMIT 1) customer
)
;

# 8 Get the client_id and the total_amount_spent of those clients who spent more than the average of the total_amount spent by each client.
SELECT customer_id, SUM(amount) AS total_amount_spent
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > (SELECT AVG(total_amount_spent)
					FROM (SELECT customer_id, SUM(amount) AS total_amount_spent
					FROM payment
					GROUP BY customer_id) AS customer_spending
)
;

