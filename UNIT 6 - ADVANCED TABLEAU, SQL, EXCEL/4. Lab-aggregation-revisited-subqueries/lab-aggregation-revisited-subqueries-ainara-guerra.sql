

# Lab aggregation revisited subqueries
## Ainara Guerra

# ----- 
USE sakila;

#1. Select the first name, last name, and email address of all the customers who have rented a movie.

SELECT 
    c.first_name, c.last_name, c.email
FROM
    customer c
        JOIN
    rental r ON c.customer_id = r.customer_id;
		# with the previous code it selects 15641 rows but there are a lot of repeated people, let's fix that:

SELECT DISTINCT
    c.first_name, c.last_name, c.email
FROM
    customer c
        JOIN
    rental r ON c.customer_id = r.customer_id;
		# Only 584 people left.

# -----

# 2. What is the average payment made by each customer (display the customer id, customer name (concatenated), and the average payment made).
SELECT DISTINCT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,
    AVG(p.amount)
FROM
    customer c
        JOIN
    payment p ON c.customer_id = p.customer_id
GROUP BY p.customer_id;

# -----

# 3. Select the name and email address of all the customers who have rented the "Action" movies.
# 3.1. Write the query using multiple join statements.
SELECT *
FROM category;
		# number 1 is for action


SELECT 
    c.first_name, c.email
FROM
    customer c
        JOIN
    rental r ON c.customer_id = r.customer_id
        JOIN
    inventory i ON r.inventory_id = i.inventory_id
        JOIN
    film_category f ON i.film_id = f.film_id
WHERE
    f.category_id = '1';
		# 1092 rows, but maybe there are some repeated. 

SELECT DISTINCT
    c.email, c.first_name
FROM
    customer c
        JOIN
    rental r ON c.customer_id = r.customer_id
        JOIN
    inventory i ON r.inventory_id = i.inventory_id
        JOIN
    film_category f ON i.film_id = f.film_id
WHERE
    f.category_id = '1';
		# 498 unique people. 

# 3.2. Write the query using sub queries with multiple WHERE clause and IN condition.
SELECT c.first_name, c.last_name, c.email
FROM customer c
WHERE c.customer_id IN (
    SELECT r.customer_id
    FROM rental r
    JOIN inventory i ON r.inventory_id = i.inventory_id
    JOIN film f ON i.film_id = f.film_id
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category cat ON fc.category_id = cat.category_id
    WHERE cat.name = 'Action'
);
		# 498 unique people. 

# 3.3. Verify if the above two queries produce the same results or not.
		# Yes, they produce the same result.
        
# -----


# 4. Use the case statement to create a new column classifying existing columns as either or high value transactions based on the amount of payment. 
# If the amount is between 0 and 2, label should be low and if the amount is between 2 and 4, the label should be medium, and if it is more than 4, then it should be high.

SELECT payment_id, amount,
    CASE
        WHEN amount BETWEEN 0 AND 2 THEN 'low'
        WHEN amount BETWEEN 2 AND 4 THEN 'medium'
        WHEN amount > 4 THEN 'high'
        ELSE 'unknown'
    END AS label
FROM payment;