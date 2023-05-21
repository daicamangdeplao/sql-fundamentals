--- Section 2
--- Challenge No. 1
SELECT email FROM customer WHERE first_name = 'Nancy' AND last_name = 'Thomas';
--- Challenge No. 2
SELECT description FROM film WHERE title = 'Outlaw Hanky';
--- Challenge No. 3
SELECT phone FROM address WHERE address = '259 Ipoh Drive';
--- Challenge No. 4
SELECT customer_id FROM payment ORDER BY payment_date LIMIT 10;
--- Challenge No. 5
SELECT title, film.length FROM film ORDER BY film.length ASC LIMIT 5;

--- 26
--- No. 1
SELECT COUNT(*) FROM payment WHERE amount > 5;
--- No. 2
SELECT COUNT(*) FROM actor WHERE first_name LIKE 'P%'; --- 5
--- No. 3
SELECT COUNT(DISTINCT(district)) FROM address;
--- No. 4
SELECT DISTINCT(district) FROM address;
--- No. 5
SELECT COUNT(*) FROM film WHERE rating = 'R' AND replacement_cost BETWEEN 5 AND 15;
--- No. 6
SELECT COUNT(*) FROM film WHERE title LIKE '%Truman%';

--- 31
--- No. 1
SELECT staff_id, COUNT(payment_date)
FROM payment
GROUP BY staff_id
ORDER BY COUNT(payment_date) DESC;

--- No. 2
SELECT rating, AVG(replacement_cost)
FROM film
GROUP BY rating
ORDER BY AVG(replacement_cost);

--- No. 3
--- What are the customer ids of the top 5 customers by total spend?
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 5;

--- 33
--- No. 1
--- What customer_ids are eligible for plantinum status?
SELECT customer_id, COUNT(*)
FROM payment
GROUP BY customer_id
HAVING COUNT(*) >= 40
ORDER BY COUNT(*) ASC;

--- No. 2
--- What are the customer ids of customers who have spent more than 100$ in payment transactions with our staff_id member 2?
SELECT customer_id, SUM(amount)
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) > 100;

--- 35
--- No. 1
--- Return the customer ids of the customers who have spent at least 110$ with the staff member who has an ID of 2
SELECT customer_id, SUM(amount)
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) >= 110;

--- No. 2
--- How many films begin with the letter 'J'?
SELECT COUNT(*)
FROM film
WHERE title like 'J%';

--- No. 3
--- What customer has the highest customer ID number whose name starts with an 'E' and has an address ID lower than 500?
SELECT first_name, last_name
FROM customer
WHERE first_name like 'E%' AND address_id < 500
ORDER BY customer_id DESC
LIMIT 1;

--- 45
--- No. 1
--- What are the customer emails of the customers who live in California?
SELECT email
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE address.district = 'California';

--- No. 2
--- Get a list of all the movies "Nick Wahlberg" has been in
SELECT film.title
FROM film
INNER JOIN film_actor
	ON film.film_id = film_actor.film_id
INNER JOIN actor
	ON actor.actor_id = film_actor.actor_id
WHERE actor.first_name = 'Nick' AND actor.last_name = 'Wahlberg';

--- 50
--- No. 1
--- During which months did payments occur?
SELECT MIN(EXTRACT(MONTH FROM payment_date)), TO_CHAR(payment_date, 'MONTH') AS text_month
FROM payment
GROUP BY TO_CHAR(payment_date, 'MONTH')
ORDER BY MIN(EXTRACT(MONTH FROM payment_date));

--- No.2
--- How many payments occured on a Monday?
--- README: ``DOW`` function results the day of a week.
SELECT MIN(EXTRACT(DOW FROM payment_date)), TO_CHAR(payment_date, 'DAY'), COUNT(TO_CHAR(payment_date, 'DAY'))
FROM payment
GROUP BY TO_CHAR(payment_date, 'DAY')
ORDER BY MIN(EXTRACT(DOW FROM payment_date));

--- README: A better solution
SELECT COUNT(*)
FROM payment
WHERE EXTRACT(DOW from payment_date) = 1;

--- 57
--- No. 1
--- How can you retrieve all information from the cd.facilities table?

--- No. 2
--- How would you retrieve a list of only facility names and costs?
SELECT cd.facilities.name, cd.facilities.membercost
FROM cd.facilities;


--- No. 3
--- How can you produce a list of facilities that charge a fee to members?
SELECT cd.facilities.name
FROM cd.facilities
WHERE cd.facilities.membercost > 0;

--- No. 4
--- How can you produce a list of facilities that charge a fee to members, and that fee is less than 1/50th of the monthly maintenance cost?
SELECT *
FROM cd.facilities
WHERE cd.facilities.membercost > 0 AND cd.facilities.membercost < (cd.facilities.monthlymaintenance / 50);

--- No. 5
--- How can you produce a list of all facilities with the word 'Tennis' in their name?
SELECT *
FROM cd.facilities
WHERE cd.facilities.name LIKE '%Tennis%';

--- No. 6
--- How can you retrieve the details of facilities with ID 1 and 5? Try to do it without using the OR operator.
SELECT *
FROM cd.facilities
WHERE cd.facilities.facid IN (1, 5);

--- No. 7
--- How can you produce a list of members who joined after the start of September 2012?
SELECT *
FROM cd.members AS members
WHERE members.joindate >= '2012-09-01';

--- No. 8
--- How can you produce an ordered list of the first 10 surnames in the members table?
SELECT DISTINCT(members.surname)
FROM cd.members AS members
ORDER BY members.surname
LIMIT 10;

--- No. 9
--- You'd like to get the signup date of your last member. How can you retrieve this information?
SELECT MAX(members.joindate)
FROM cd.members AS members;

--- No. 10
--- Produce a count of the number of facilities that have a cost to guests of 10 or more.
SELECT COUNT(*)
FROM cd.facilities AS facilities
WHERE facilities.guestcost >= 10;

--- No. 11
--- Produce a list of the total number of slots booked per facility in the month of September 2012. Produce an output table consisting of facility id and slots, sorted by the number of slots.
SELECT bookings.facid, SUM(bookings.slots)
FROM cd.bookings AS bookings
WHERE bookings.starttime BETWEEN '2012-09-01' AND '2012-10-01'
GROUP BY bookings.facid
ORDER BY SUM(bookings.slots);

--- No. 12
--- Produce a list of facilities with more than 1000 slots booked. Produce an output table consisting of facility id and total slots, sorted by facility id.
SELECT facilities.facid, SUM(bookings.slots)
FROM cd.facilities AS facilities
INNER JOIN cd.bookings AS bookings
	ON facilities.facid = bookings.facid
GROUP BY facilities.facid
HAVING SUM(bookings.slots) > 1000
ORDER BY facilities.facid;

--- No. 13
--- How can you produce a list of the start times for bookings for tennis courts, for the date '2012-09-21'? Return a list of start time and facility name pairings, ordered by the time.
SELECT facilities.name, bookings.starttime
FROM cd.facilities AS facilities
INNER JOIN cd.bookings AS bookings
	ON facilities.facid = bookings.facid
WHERE facilities.name LIKE '%Tennis Court%' AND DATE(bookings.starttime) = '2012-09-21';

--- No. 14
--- How can you produce a list of the start times for bookings by members named 'David Farrell'?
SELECT bookings.starttime
FROM cd.members AS members
INNER JOIN cd.bookings AS bookings
	ON members.memid = bookings.memid
WHERE members.firstname = 'David' AND members.surname = 'Farrell';
