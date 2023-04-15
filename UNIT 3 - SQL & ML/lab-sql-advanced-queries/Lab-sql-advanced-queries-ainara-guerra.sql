# LAB SQL ADVANCED QUERIES | AINARA GUERRA
USE sakila;
# This is for exercise
# ----- This is for queries


# List each pair of actors that have worked together.
SELECT distinct fa1.film_id, a1.first_name, a1.last_name, a2.first_name, a2.last_name
FROM film_actor fa1
JOIN actor a1 
ON fa1.actor_id = a1.actor_id
JOIN film_actor fa2 
ON fa1.film_id = fa2.film_id AND fa1.actor_id < fa2.actor_id
JOIN actor a2 
ON fa2.actor_id = a2.actor_id
ORDER BY a1.last_name, a2.last_name;




# For each film, list actor that has acted in more films.
# ----- I assume that it is asking for each film, the one actor that has acted in more films than any other actor in that film, so:
SELECT f.title film_title, a.actor_id, a.first_name, a.last_name
FROM film f
LEFT JOIN film_actor fa 
ON f.film_id = fa.film_id
LEFT JOIN (SELECT actor_id, COUNT(*) film_count
			FROM film_actor 
            GROUP BY actor_id 
            HAVING COUNT(*) = (SELECT COUNT(*) 
								FROM film_actor 
                                GROUP BY actor_id 
                                ORDER BY COUNT(*) DESC 
                                LIMIT 1
								) 
			) film_count1 #	This is to get the the actor(s) who have acted in the most films across all films.
ON fa.actor_id = film_count1.actor_id
JOIN actor a 
ON fa.actor_id = a.actor_id
WHERE fa.actor_id = (SELECT fa2.actor_id 
					FROM film_actor fa2
                    JOIN (SELECT actor_id, COUNT(*) AS film_count
						FROM film_actor
						WHERE film_id = f.film_id
						GROUP BY actor_id
						ORDER BY COUNT(*) DESC 
						LIMIT 1
						) film_count2 ON fa2.actor_id = film_count2.actor_id # i use this query to identify the actor who have acted in the most films for each film
					WHERE fa2.film_id = f.film_id
					GROUP BY fa2.film_id, fa2.actor_id
					HAVING COUNT(*) = 1 # we only want one actor.
  )
ORDER BY  f.title;
