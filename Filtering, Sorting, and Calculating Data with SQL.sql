# This is the link for the ER diagram for the following queries
# https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/wm4baRQTEeiiPArjBtafbA_25ea1bc56924a149794ab65d39f07e9f_ChinookDatabaseSchema-ER-Diagram.png?expiry=1633564800000&hmac=BkNnCBiD3cyjeeAdM7GhW7tUGBkd-IRjYVjghNUr1js

#1. Run Query: Find all the tracks that have a length of 5,000,000 milliseconds or more.

SELECT COUNT(trackid), Milliseconds
FROM Tracks
WHERE Milliseconds >= 5000000;

#2. Run Query: Find all the invoices whose total is between $5 and $15 dollars.

SELECT count(*) as total_records
FROM Invoices
WHERE TOTAL BETWEEN 5 AND 15

#3. Find all the customers from the following States: RJ, DF, AB, BC, CA, WA, NY.

SELECT *
FROM Customers
WHERE state IN ('RJ','DF','AB','BC', 'CA', 'WA', 'NY')

#4. Run Query: Find all the invoices for customer 56 and 58 where the total was between $1.00 and $5.00.

SELECT invoiceid, customerID, total, invoicedate
FROM Invoices
WHERE customerID IN (56,58)
   AND total BETWEEN 1 AND 5
Group by invoiceID

#5. Run Query: Find all the tracks whose name starts with 'All'.

SELECT COUNT(*)
FROM Tracks
WHERE Name LIKE 'All%'

#6. Run Query: Find all the customer emails that start with "J" and are from gmail.com.

SELECT *
FROM Customers
WHERE email LIKE 'J%@gmail.com'

#7. Run Query: Find all the invoices from the billing city Brasília, Edmonton, and Vancouver and sort in descending order by invoice ID.

SELECT *
FROM Invoices
WHERE billingcity in ('Brasília','Edmonton','Vancouver')
ORDER BY InvoiceId DESC

#8. Run Query: Show the number of orders placed by each customer (hint: this is found in the invoices table) and sort the result by the number of orders in descending order.

SELECT customerid, Count(*)
FROM Invoices
GROUP BY customerID
ORDER BY count(*) DESC

#9. Run Query: Find the albums with 12 or more tracks.

SELECT AlbumId, count(*)
FROM tracks
GROUP BY AlbumId
HAVING count(*) >=12;
