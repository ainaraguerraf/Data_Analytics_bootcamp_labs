# LAB SQL JOIN
use sakila;
# --> Comments

# 1 -- List the number of films per category.
select F.category_id, C.name, count(distinct F.film_id) total_films_per_category
from film_category F
INNER JOIN category C
ON C.category_id = F.category_id
group by F.category_id;

# 2 -- Display the first and the last names, as well as the address, of each staff member.
select s.first_name, s.last_name, a.address
from staff s
INNER JOIN address a
ON s.address_id =  a.address_id;


# 3 -- Display the total amount rung up by each staff member in August 2005.
SELECT s.first_name, s.last_name, SUM(p.amount) AS total_amount
FROM payment p
INNER JOIN staff s ON p.staff_id = s.staff_id
WHERE p.payment_date >= '2005-08-01' AND p.payment_date < '2005-09-01'
GROUP BY s.staff_id;


# 4 -- List all films and the number of actors who are listed for each film.
SELECT f.title, a.film_id, count(a.actor_id) total_actors
from film f
INNER JOIN film_actor a
ON a.film_id = f.film_id
GROUP BY a.film_id;

# 5 -- Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.
SELECT c.customer_id, c.first_name, c.last_name, sum(p.amount) total_payments
from customer c
JOIN payment p
ON c.customer_id = c.customer_id
GROUP BY c.customer_id
order by c.last_name asc;

