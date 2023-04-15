## LAB MULTIPLE TABLES - AINARA GUERRA

# ---- this is the symbols for comments. I put before each query what I am using to make things easier. 

use sakila;
# 1 Write a query to display for each store its store ID, city, and country.

# ---- From store s: store_id 
# ---- From address a: address_id, city_id
# ---- From city ci: city_id, country_id
# ---- From country c: country_id, country

SELECT s.store_id, ci.city, c.country
FROM store s
JOIN address a
ON s.address_id = a.address_id
JOIN city ci
ON a.city_id = ci.city_id
JOIN country c
ON ci.country_id = c.country_id
group by store_id;

# 2 Write a query to display how much business, in dollars, each store brought in.

# ---- From payment p: p.amount, p.staff_id
# ---- From staff s: s.staff_id, s.store_id
SELECT s.store_id, sum(p.amount) Benefits
FROM payment p
JOIN staff s
ON p.staff_id = s.staff_id
group by store_id;


# 3 What is the average running time of films by category?

# ---- From film f: f.film_id, f.length
# ---- From film_category fc: fc.film_id, fc.category_id
# ---- From category c: c.category_id, c.name

SELECT c.name category, AVG(f.length) average_length
FROM film f
JOIN film_category fc
ON f.film_id = fc.film_id
JOIN category c
ON fc.category_id = c.category_id
group by c.name;


# 4 Which film categories are longest?

# ---- Assuming that this means the longest average length... 

# ---- From film f: f.film_id, f.length
# ---- From film_category fc: fc.film_id, fc.category_id
# ---- From category c: c.category_id, c.name

SELECT c.name category, AVG(f.length) average_length
FROM film f
JOIN film_category fc
ON f.film_id = fc.film_id
JOIN category c
ON fc.category_id = c.category_id
group by c.name
order by average_length desc;



# 5 Display the most frequently rented movies in descending order.

# ---- From film f: f.title, f.film_id
# ---- From inventory i: i.inventory_id, i.film_id
# ---- From rental r: r.rental_id, r.inventory_id

SELECT f.title Movies, count(r.rental_id) total_rentals
FROM film f
JOIN inventory i
ON f.film_id = i.film_id
JOIN rental r
ON i.inventory_id = r.inventory_id
group by f.title
order by total_rentals desc;

# 6 List the top five genres in gross revenue in descending order.

# ---- From category c: c.category_id, c.name
# ---- From film_category fc: fc.film_id, fc.category_id
# ---- From inventory i: i.inventory_id, i.film_id
# ---- From rental r: r.rental_id, r.inventory_id
# ---- From payment p: p.rental_id, p.amount

SELECT 
    c.name category, SUM(p.amount) total_revenue
FROM
    category c
        JOIN
    film_category fc ON c.category_id = fc.category_id
        JOIN
    inventory i ON fc.film_id = i.film_id
        JOIN
    rental r ON i.inventory_id = r.inventory_id
        JOIN
    payment p ON r.rental_id = p.rental_id
GROUP BY c.name
ORDER BY total_revenue DESC
LIMIT 5;


# 7 Is "Academy Dinosaur" available for rent from Store 1?
# ---- From film f: f.film_id, f.title
# ---- inventory i: i.film_id, i.inventory_id
# ---- From rental r: r.inventory_id, r.rental_id, r.return_date, r.staff_id
# ---- From staff st: st.staff_id, st.store_id

SELECT f.title Movie, r.return_date, st.store_id
FROM film f
JOIN inventory i
ON f.film_id = i.film_id
JOIN rental r
ON i.inventory_id = r.inventory_id
JOIN staff st
ON r.staff_id = st.staff_id
where f.title = "Academy Dinosaur" AND st.store_id = "1";
#All 15 Academy Dinosaur movies in store 1 are returned, so they are available. 
