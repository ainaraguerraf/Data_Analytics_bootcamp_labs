use sakila;
# = Exercise
# -----> = COMMENT


# Create a table rentals_may to store the data from rental table with information for the month of May.
# Insert values in the table rentals_may using the table rental, filtering values only for the month of May.

# -----> I did both at the same time 
# -----> I considered that the activity that they want to know is the rental_date, so that's the column that I filtered to created the new table. 
SELECT *
from rental
WHERE MONTH(rental_date) = 5;
# We should have 1156 rows in the new list

CREATE TABLE rentals_may AS
    SELECT *
    FROM rental
    WHERE MONTH(rental_date) = 5;
    
SELECT *
FROM rentals_may;
# It worked yay!


# Create a table rentals_june to store the data from rental table with information for the month of June.
# Insert values in the table rentals_june using the table rental, filtering values only for the month of June.
SELECT *
FROM rental
WHERE MONTH(rental_date) = 6;
# We should have 2311 rows in the new list


CREATE TABLE rentals_june AS
    SELECT *
    FROM rental
    WHERE MONTH(rental_date) = 6;
    
SELECT *
FROM rentals_june;
# It worked yay!


# Check the number of rentals for each customer for May.
SELECT customer_id, count(rental_id) total_rentals_may_per_customer
FROM rentals_may
GROUP BY customer_id
ORDER BY total_rentals_may_per_customer DESC;
#520 rows detected.

# Check the number of rentals for each customer for June.
SELECT customer_id, count(rental_id) total_rentals_june_per_customer
FROM rentals_june
GROUP BY customer_id
ORDER BY total_rentals_june_per_customer DESC;
#590 rows detected.
