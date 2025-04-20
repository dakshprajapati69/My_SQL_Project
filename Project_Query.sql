							/*SQL PROJECT- MUSIC STORE DATA ANALYSIS
									Question Set 1 - Easy
									
1. Who is the senior most employee based on job title?*/

select * from employee order by levels desc limit 1

/*2. Which countries have the most Invoices?*/

select billing_country , count(invoice_id) As Num_Of_Invoices from invoice group by billing_country order by count(invoice_id) desc limit 1

/* 3. What are top 3 values of total invoice? */

select * from invoice order by total desc limit 3

/* 4. Which city has the best customers? We would like to throw a promotional Music
Festival in the city we made the most money. Write a query that returns one city that
has the highest sum of invoice totals. Return both the city name & sum of all invoice
totals
*/

select billing_city , sum(total) from invoice group by billing_city order by sum(total) desc limit 1


/* 5. Who is the best customer? The customer who has spent the most money will be
declared the best customer. Write a query that returns the person who has spent the
most money */

select customer.customer_id ,first_name,last_name,sum(total) from customer inner join invoice on customer.customer_id=invoice.customer_id
group by customer.customer_id
order by sum(total) desc
limit 1


								/* Question Set 2 – Moderate

								
1. Write query to return the email, first name, last name, & Genre of all Rock Music
listeners. Return your list ordered alphabetically by email starting with A  */


select distinct customer.customer_id first_name,last_name,email
from customer join invoice on customer.customer_id=invoice.customer_id
join invoice_line on invoice_line.invoice_id = invoice.invoice_id
join track on track.track_id = invoice_line.track_id
join genre on genre.genre_id = track.genre_id
where genre.name like 'Rock'
order by email


/* 3. Return all the track names that have a song length longer than the average song length.
Return the Name and Milliseconds for each track. Order by the song length with the
longest songs listed first */

select name, milliseconds from track where milliseconds>(select avg(milliseconds) as avg_millsecond from track) order by milliseconds desc