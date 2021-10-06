--All of the questions in this quiz pull from the open source Chinook Database. 

--1. How many albums does the artist Led Zeppelin have? 

SELECT COUNT(DISTINCT AlbumId)
FROM Albums 
WHERE ArtistID IN(SELECT ArtistID
    FROM Artists
    WHERE Name='Led Zeppelin')
    
--2. Create a list of album titles and the unit prices for the artist "Audioslave".

SELECT a.AlbumId, a.title, t.unitprice
FROM albums a INNER JOIN tracks t ON a.albumId = t.albumId
WHERE ArtistID IN(SELECT ArtistID
    FROM Artists
    WHERE Name='Audioslave') 
    
--3. Find the first and last name of any customer who does not have an invoice. Are there any customers returned from the query?

SELECT n.FirstName, n.LastName, i.Invoiceid
FROM customers n 
LEFT JOIN invoices i ON n.Customerid = i.Customerid
WHERE InvoiceId IS NULL

--4. Find the total price for each album.

SELECT T.AlbumID, A.Title, SUM(T.UnitPrice)
FROM Tracks T
LEFT JOIN Albums A ON T.AlbumID=A.AlbumID
WHERE A.Title='Big Ones'
GROUP BY A.Title

--5. How many records are created when you apply a Cartesian join to the invoice and invoice items table?

SELECT trackID, unitprice
FROM invoice_items CROSS JOIN invoices;

--6. Using a subquery, find the names of all the tracks for the album "Californication".

SELECT Name
FROM Tracks
WHERE AlbumId IN (SELECT AlbumId
    FROM Albums
    WHERE Title='Californication')
    
--7. Find the total number of invoices for each customer along with the customer's full name, city and email.

SELECT CustomerID, 
    FirstName, 
    LastName, 
    email, 
    (SELECT Count(*) as InvoicesTotal
        FROM Invoices
        WHERE invoices.customerid = customers.customerid) as InvoicesTotal
FROM Customers
GROUP BY CustomerId

--8. Retrieve the track name, album, artistID, and trackID for all the albums.

SELECT Tracks.TrackId, Tracks.Name, Albums.Title, Artists.ArtistId
FROM Artists
JOIN Albums 
    ON Artists.ArtistId=Albums.ArtistId
JOIN Tracks
    ON Tracks.AlbumId=Albums.ArtistId
WHERE Albums.Title LIKE 'For Those About to Rock We Salute You'
ORDER BY TrackId

--9. Retrieve a list with the managers last name, and the last name of the employees who report to him or her.

SELECT M.LastName AS Manager, 
       E.LastName AS Employee
FROM Employees E 
INNER JOIN Employees M 
ON E.ReportsTo = M.EmployeeID

--10. Find the name and ID of the artists who do not have albums. 

SELECT Artists.ArtistID, Artists.Name as Artist, Albums.AlbumId, Albums.Title
FROM Artists
LEFT JOIN Albums ON Artists.ArtistID=Albums.ArtistID
WHERE AlbumID is NULL
ORDER BY Artists.ArtistID

--11. Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order.

SELECT FirstName, LastName
FROM Employees
UNION
SELECT FirstName, LastName
FROM Customers
ORDER BY LastName DESC;

--12. See if there are any customers who have a different city listed in their billing city versus their customer city.

SELECT COUNT(*)
FROM Customers C
LEFT JOIN Invoices I ON C.CustomerID = I.CustomerID
WHERE NOT C.Address=I.BillingAddress
