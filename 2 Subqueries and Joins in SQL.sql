--All of the questions in this quiz pull from the open source Chinook Database. 

#1. How many albums does the artist Led Zeppelin have? 

SELECT COUNT(DISTINCT AlbumId)
FROM Albums 
WHERE ArtistID IN(SELECT ArtistID
    FROM Artists
    WHERE Name='Led Zeppelin')
    
#2. Create a list of album titles and the unit prices for the artist "Audioslave".

SELECT a.AlbumId, a.title, t.unitprice
FROM albums a INNER JOIN tracks t ON a.albumId = t.albumId
WHERE ArtistID IN(SELECT ArtistID
    FROM Artists
    WHERE Name='Audioslave') 
    
#3. Find the first and last name of any customer who does not have an invoice. Are there any customers returned from the query?

SELECT n.FirstName, n.LastName, i.Invoiceid
FROM customers n 
LEFT JOIN invoices i ON n.Customerid = i.Customerid
WHERE InvoiceId IS NULL

#4. Find the total price for each album.

SELECT T.AlbumID, A.Title, SUM(T.UnitPrice)
FROM Tracks T
LEFT JOIN Albums A ON T.AlbumID=A.AlbumID
WHERE A.Title='Big Ones'
GROUP BY A.Title

#5. How many records are created when you apply a Cartesian join to the invoice and invoice items table?

SELECT trackID, unitprice
FROM invoice_items CROSS JOIN invoices;

