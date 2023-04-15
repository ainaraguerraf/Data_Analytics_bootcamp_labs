use sakila;
# 1----How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name)
FROM actor;
#121 unique last names

# 2----In how many different languages where the films originally produced? (Use the column language_id from the film table)
SELECT COUNT(DISTINCT language_id)
FROM film;
#1 unique language


# 3----How many movies were released with "PG-13" rating?
SELECT COUNT(DISTINCT film_id)
FROM film
WHERE rating = "PG-13";
#223 movies


# 4----Get 10 the longest movies from 2006.
SELECT title 
FROM film
WHERE release_year = "2006"
ORDER BY length desc
LIMIT 10;

# DARN FORRESTER
# POND SEATTLE
# CHICAGO NORTH
# MUSCLE BRIGHT
# WORST BANGER
# GANGS PRIDE
# SOLDIERS EVOLUTION
# HOME PITY
# SWEET BROTHERHOOD
# CONTROL ANTHEM


# 5----How many days has been the company operating (check DATEDIFF() function)?
#TRYING WITH RENTAL DATE and LAST UPDATE because they are the maximun and minimun dates that we found in the breackout room.
SELECT min(rental_date), max(rental_date)
FROM rental;

SELECT datediff(max(last_update), min(rental_date)) AS date_difference
FROM rental;
#275 days

# 6----Show rental info with additional columns month and weekday. Get 20.
select rental_id, date_format(rental_date, "%W") as weekday, date_format(rental_date, "%M") as month
FROM rental
limit 20;



# 7----Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT  *, #COMMA NEEDED
CASE
	WHEN (DAYNAME(rental_date) in (0,6)) THEN "Weekend"
	ELSE "Workday"
    END as day_date
FROM rental;

# 8----How many rentals were in the last month of activity?
SELECT rental_id, rental_date
FROM rental
where rental_date LIKE "2006-02%"
ORDER BY rental_date desc;
