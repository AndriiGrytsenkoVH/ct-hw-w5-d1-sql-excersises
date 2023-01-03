--1. How many actors are there with the last name ‘Wahlberg’?
select count(*)
	from actor
	where last_name = 'Wahlberg';
-- ANSWER = 2

--2. How many payments were made between $3.99 and $5.99?
select count(*)
	from payment
	where amount between 3.99 and 5.99;
-- ANSWER = 5,607
	
--3. What films have exactly 7 copies? (search in inventory)
select film_id, count(*)
	from inventory
	group by film_id
	having count(*) = 7;
-- ANSWER = 116 films 
-- with id's: {273,951,22...etc...}

--4. How many customers have the first name ‘Willie’?
select count(*)
	from customer
	where first_name ='Willie';
-- ANSWER = 2

--5. What store employee (get the id) sold the most rentals (use the rental table)?
select staff_id, count(*)
	from rental
	group by staff_id
	order by count(*) desc;
-- ANSWER = 1 
-- with 8,040 rentals

--6. How many unique district names are there?
select district, count(*) over ()
	from address
	group by district
	order by district;
-- ANSWER = 378
-- 'over' counts rows for us, but duplicates the answer...

-- 7. What film has the most actors in it? (use film_actor table and get film_id)
select film_id, count(*)
	from film_actor
	group by film_id
	order by count(*) desc;
-- ANSWER = 508
-- film_id 508 with 15 actors

--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
select customer_id, last_name, count(*) over ()
	from customer
	where last_name like '%es'
	order by customer_id;
-- ANSWER = 21

--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--with ids between 380 and 430? (use group by and having > 250)
select amount, count(*), count(*) over ()
	from payment
	group by amount
	having count(*) > 250;
-- ANSWER 9

--10. Within the film table, how many rating categories are there? And what rating has the most
--movies total?
select rating, count(*), count(*) over ()
	from film
	group by rating 
	order by count(*) desc;
-- ANSWER = 5 raitings 
-- with PG-13 being the most common at 223 films