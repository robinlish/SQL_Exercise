/*All of the questions in this quiz refer to the open source Chinook Database. Please familiarize yourself with the ER diagram to familiarize yourself with the table and column names to write accurate queries and get the appropriate answers.

1. Run Query: Find all the tracks that have a length of 5,000,000 milliseconds or more.*/
select trackid,
milliseconds
from tracks
where milliseconds > '5000000'

--2. Run Query: Find all the invoices whose total is between $5 and $15 dollars.
select invoiceid,
total
from invoices
where total between 5 and 15

--3.Run Query: Find all the customers from the following States: RJ, DF, AB, BC, CA, WA, NY.
select customerid,
firstname,
lastname,
state,
company
from customers
where state in ('RJ', 'DF', 'AB', 'BC', 'CA', 'WA', 'NY')

--4. Run Query: Find all the invoices for customer 56 and 58 where the total was between $1.00 and $5.00.
select customerid, invoiceid, invoicedate, total
from invoices
where (customerid between 56 and 58) 
and total between 1 and 5

--5. Run Query: Find all the tracks whose name starts with 'All'.
select *
from tracks
where name like 'all%'

--6. Run Query: Find all the customer emails that start with "J" and are from gmail.com.
select *
from customers
where email like 'j%gmail.com'

--7. Run Query: Find all the invoices from the billing city Brasilia, Edmonton, and Vancouver and sort in descending order by invoice ID.
select *
from invoices
where billingcity in ('Brasilia', 'Edmonton', 'Vancouver')
order by invoiceid desc

--8.Run Query: Show the number of orders placed by each customer (hint: this is found in the invoices table) and sort the result by the number of orders in descending order.
select customerid, 
COUNT(invoiceid) as numbers
from invoices
group by customerid
order by numbers desc

--9. Run Query: Find the albums with 12 or more tracks.
select albumid,
count(trackid) as tracknumbers
from tracks
group by albumid
having tracknumbers > 12