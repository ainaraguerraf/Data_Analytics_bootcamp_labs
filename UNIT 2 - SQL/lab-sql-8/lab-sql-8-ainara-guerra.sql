
use sakila;

# 1.Rank films by length (filter out the rows with nulls or zeros in length column). 
#Select only columns title, length and rank in your output.

#---- In case anything is repeated, let's use rank
SELECT title, length, dense_rank() OVER (ORDER BY length DESC) Length_Ranking
FROM film
where length > 0
limit 100;

# 2.Rank films by length within the rating category (filter out the rows with nulls or zeros in length column). 
#In your output, only select the columns title, length, rating and rank.
SELECT title, length, rating, dense_rank() OVER (PARTITION BY rating ORDER BY length DESC) Length_Ranking
FROM film
WHERE length IS NOT NULL AND length != 0 
limit 500;

# 3.How many films are there for each of the categories in the category table? 
#Hint: Use appropriate join between the tables "category" and "film_category".
SELECT C.name, COUNT(F.film_id) number_films 
FROM category C
INNER JOIN film_category F
ON C.category_id = f.category_id
group by C.name
order by number_films desc
LIMIT 10;

# 4.Which actor has appeared in the most films? 
#Hint: You can create a join between the tables "actor" and "film actor" and count the number of times an actor appears.
SELECT CONCAT(A.First_name , ' ' , A.last_name) as Name, A.actor_id, COUNT(F.film_id) number_films_per_actor
FROM actor A
INNER JOIN film_actor F
ON A.actor_id = F.actor_id
group by A.actor_id
order by number_films_per_actor desc
LIMIT 10;

# 5.Which is the most active customer (the customer that has rented the most number of films)? 
#Hint: Use appropriate join between the tables "customer" and "rental" and count the rental_id for each customer.
SELECT C.customer_id, COUNT(R.rental_id) number_rentals
FROM customer C	
INNER JOIN rental R
ON C.customer_id = R.customer_id
group by C.customer_id
order by number_rentals desc
LIMIT 1;

# And the name and last name of this person is:
select first_name, last_name, customer_id
from customer
where customer_id = 148;

# Eleanor Hunt, id:148

#Bonus: Which is the most rented film? (The answer is Bucket Brotherhood).
#This query might require using more than one join statement. Give it a try. We will talk about queries with multiple join statements later in the lessons.
#Hint: You can use join between three tables - "Film", "Inventory", and "Rental" and count the rental ids for each film.

SELECT R.inventory_id, COUNT(R.rental_id) times_rented, F.film_id, F.title
FROM Inventory AS I
   INNER JOIN
   rental AS R
   ON I.inventory_id = R.inventory_id
   INNER JOIN
   film AS F
   ON I.film_id = F.film_id
group by I.inventory_id
order by times_rented desc
LIMIT 1;

#It gives me Zorro Ark as an answer, not Bucket Brotherhood :(