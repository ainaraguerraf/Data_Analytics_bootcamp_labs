USE sakila;

# 1. Drop column picture from staff.
ALTER TABLE staff
DROP COLUMN picture;

# 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
SELECT *
FROM CUSTOMER
WHERE last_name = 'sanders';

INSERT INTO staff
VALUES (3,'Tammy','Sanders','79','TAMMY.SANDERS@sakilacustomer.org','1','1','Tammy', '0000','2006-02-15 04:57:20');

SELECT *
FROM staff;

#3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1.

#We need to search for the inventory info to add it to the rental
SELECT *
FROM film
WHERE title= 'Academy Dinosaur';

#And now, the inventory number of the film
SELECT *
FROM inventory
WHERE film_id = '1';

#check that that inventory is returned. It appears a return date so we assume that is returned.
SELECT *
FROM rental
WHERE inventory_id = "1";

# check the last rental_id.
SELECT MAX(rental_id)
FROM rental;
#16049

#check the customer.
SELECT customer_id 
FROM sakila.customer
WHERE first_name = 'CHARLOTTE' and last_name = 'HUNTER';
#130

#add it:
INSERT INTO rental
VALUES (16050,'2005-08-21 21:27:43',1,130,Now(),1,"2006-02-15 21:30:53");



#4. Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. 
SELECT distinct active from sakila.customer;


SELECT customer_id, email
FROM customer
WHERE active = 0;

CREATE TABLE backup_table1 (
deleted_id INT PRIMARY KEY,
customer_id VARCHAR(11),
email VARCHAR(255), 
date_deleted datetime default null
);

SELECT *
FROM backup_table1;

INSERT INTO backup_table1 (deleted_id,customer_id, email, date_deleted)
VALUES 
(1,16,'SANDRA.MARTIN@sakilacustomer.org',Now()),
(2,64,'JUDITH.COX@sakilacustomer.org',Now()),
(3,124,'SHEILA.WELLS@sakilacustomer.org',Now()),
(4,169,'ERICA.MATTHEWS@sakilacustomer.org',Now()),
(5,241,'HEIDI.LARSON@sakilacustomer.org',Now()),
(6,271,'PENNY.NEAL@sakilacustomer.org',Now()),
(7,315,'KENNETH.GOODEN@sakilacustomer.org',Now()),
(8,368,'HARRY.ARCE@sakilacustomer.org',Now()),
(9,406,'NATHAN.RUNYON@sakilacustomer.org',Now()),
(10,446,'THEODORE.CULP@sakilacustomer.org',Now()),
(11,482,'MAURICE.CRAWLEY@sakilacustomer.org',Now()),
(12,510,'BEN.EASTER@sakilacustomer.org',Now()),
(13,534,'CHRISTIAN.JUNG@sakilacustomer.org',Now()),
(14,558,'JIMMIE.EGGLESTON@sakilacustomer.org',Now()),
(15,592,'TERRANCE.ROUSH@sakilacustomer.org',Now());

SELECT *
FROM backup_table1;

SET FOREIGN_KEY_CHECKS=0;

DELETE FROM customer
WHERE active = 0;