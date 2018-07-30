/*All of the questions in this quiz pull from the open source Chinook Database. 
Please refer to the ER Diagram below and familiarize yourself with 
the table and column names to write accurate queries and get the appropriate answers.*/

-- I. Exercise:
--1. How many albums does the artist Led Zeppelin have?
select artists.artistid,
artists.name,
count (albums.albumid) as num,
albums.albumid
from artists inner join albums
on artists.artistid = albums.artistid
where (artists.name = 'Led Zeppelin')
group by artists.artistid

--2. Create a list of album titles and the unit prices for the artist "Audioslave".
select albums.title,
tracks.unitprice
from albums inner join tracks
on albums.albumid = tracks.albumid
where albums.artistid = (select artistid
        from artists
        where artists.name = 'Audioslave')



--3. Find the first and last name of any customer who does not have an invoice. Are there any customers returned from the query?
select customers.firstname,
customers.lastname,
invoices.invoiceid
from customers left join invoices on
customers.customerid = invoices.customerid
where invoices.invoiceid = null

--4. Find the total price for each album.
select albums.title,
sum (tracks.unitprice) as price
from albums inner join tracks on albums.albumid = tracks.albumid
group by tracks.albumid

--5. How many records are created when you apply a Cartesian join to the invoice and invoice items table?

--II. Quiz:

--1. Using a subquery, find the names of all the tracks for the album "Californication".
select trackid,
name
from tracks
where albumid = (select albumid
                  from albums
                  where title = "Californication")
--2. Find the total number of invoices for each customer along with the customer's full name, city and email.
select count(invoiceid),
firstname,
lastname,
city,
email
from customers c inner join invoices i on c.customerid = i.customerid

--3. Retrieve the track name, album, artistID, and trackID for all the albums.
select title, artistid, trackid, name 
from albums a inner join tracks t on
a.albumid = t.albumid

--4. Retrieve a list with the managers last name, and the last name of the employees who report to him or her.
select a.lastname as employee,
b.lastname as manager,
a.reportsto
from employees a, employees b
where a.reportsto = b.employeeid

--5. Find the name and ID of the artists who do not have albums.
SELECT ar.ArtistId
	,ar.Name
FROM Artists ar
LEFT JOIN Albums al ON ar.ArtistId = al.ArtistId
WHERE al.ArtistID IS NULL

--6. Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order.
--After running the query described above, determine what is the last name of the 6th record? Enter it below. 
--Remember to order things in descending order to be sure to get the correct answer.
select firstname, lastname
from employees
union
select firstname, lastname
from customers
order by lastname desc

--7. See if there are any customers who have a different city listed in their billing city versus their customer city.
select c.customerid,
city,
billingcity
from customers c inner join invoices i on c.customerid = i.customerid
where city != billingcity

                  