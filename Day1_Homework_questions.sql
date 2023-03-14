
-- 1.  How many actors are there with the last name 'Wahlberg'?
SELECT *
FROM actor
WHERE last_name = 'Wahlberg';
 -- There are two actors with last name Wahlberg

-- 2. How many payments were made between $3.99 and $5.99?
SELECT COUNT(*)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;
-- There are 5,607 payments made between $3.99 and $5.99

-- 3. What films have exactly 7 copies? (search in inventory)
SELECT film_id, COUNT(*) AS quantity
FROM inventory 
GROUP BY film_id
HAVING COUNT(*) = 7;

SELECT COUNT(*)
FROM 
    (SELECT film_id, COUNT(*) AS quantity  
    FROM inventory
    GROUP BY film_id
    HAVING COUNT(*) = 7) GR


-- 116 films have exactly 7 copies

-- 4. How many customers have the first name 'Willie'?
SELECT COUNT(*)
FROM customer
WHERE first_name = 'Willie';
-- Two customers first name is Willie

-- 5. What store employee (get the id) sold most rentals (use the rental table)?
SELECT staff_id, COUNT(*)
FROM rental
GROUP BY staff_id;
-- The staff_id number 1

-- 6. How many unique district names are there?
SELECT district, COUNT(*)
FROM address
GROUP BY district;

SELECT COUNT(*)
FROM
    (SELECT district, COUNT(*) AS quantity 
     FROM address
     GROUP BY district
     HAVING COUNT(*) = COUNT(*)) GR

-- 378 unique district names are there

-- 7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, COUNT(actor_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(actor_id) DESC;

-- The film_id 508 has the most actors 15

-- 8. From store_id 1, how many customers have a last name ending with 'es'? (use customer table)
SELECT COUNT(*)
FROM customer 
WHERE store_id = 1  AND last_name LIKE '%es';

-- 13 customeres have last name ending with 'es'

-- 9. How many payment amount(4.99,5.99,etc) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)

SELECT amount, COUNT(*)
FROM payment 
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount 
HAVING COUNT(*) > 250;

-- Three payments amount 

-- 10. Within the film table, how many rating categories are there? And what rating has the most 
-- movies total?

SELECT COUNT(rating)
FROM film 
GROUP BY rating;

-- There are five rating categories
