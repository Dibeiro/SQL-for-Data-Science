Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet
This is a 2-part assignment. In the first part, you are asked a series of questions that will help you profile and understand the data just like a data scientist would. For this first part of the assignment, you will be assessed both on the correctness of your findings, as well as the code you used to arrive at your answer. You will be graded on how easy your code is to read, so remember to use proper formatting and comments where necessary.
In the second part of the assignment, you are asked to come up with your own inferences and analysis of the data for a particular research question you want to answer. You will be required to prepare the dataset for the analysis you choose to do. As with the first part, you will be graded, in part, on how easy your code is to read, so use proper formatting and comments to illustrate and communicate your intent as required.
For both parts of this assignment, use this "worksheet." It provides all the questions you are being asked, and your job will be to transfer your answers and SQL coding where indicated into this worksheet so that your peers can review your work. You should be able to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) to copy and paste your answers. If you are going to use Word or some other page layout application, just be careful to make sure your answers and code are lined appropriately.
In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer.

Part 1: Yelp Dataset Profiling and Understanding
1. Profile the data by finding the total number of records for each of the tables below:
i. Attribute table = 10000 rows
ii. Business table = 10000 rows
iii. Category table = 10000 rows
iv. Checking table =10000 rows
v. elite years table =10000 rows
vi. friend table = 10000 rows
vii. hours table =10000 rows
viii. photo table = 10000 rows
ix. review table = 10000 rows
x. tip table = 10000 rows
xi. user table =10000 rows
           
2. Find the total distinct records by either the foreign key or primary key (PK) for each table. If two foreign keys are listed in the table, please specify which foreign key (FK).
Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.

 i. Business = 10000 (PK)
 
SELECT COUNT (DISTINCT id)
FROM Business

ii. Hours = 1562 (FK)

SELECT COUNT (DISTINCT business_id)
FROM Hours

iii. Category = 2643 (FK)

SELECT COUNT (DISTINCT business_id)
FROM Category

iv. Attribute = 1115 (FK)

SELECT COUNT (DISTINCT business_id)
FROM Attribute

v. Review = 10000 (PK – id) / 8090 (FK – business_id) / 9581(FK – user_id)

SELECT COUNT (DISTINCT id)
FROM Review

SELECT COUNT (DISTINCT business_id)
FROM Review

SELECT COUNT (DISTINCT user_id)
FROM Review

vii. Photo = 10000 (PK - id) / 6493 (FK – business_id)

SELECT COUNT (DISTINCT business_id)
FROM Photo

SELECT COUNT (DISTINCT id)
FROM Photo

viii. Tip = 537 (FK – user_id) / 3979 (FK – business_id)

SELECT COUNT (DISTINCT user_id)
FROM Tip

SELECT COUNT (DISTINCT business_id)
FROM Tip

ix. User = 10000 (PK)

SELECT COUNT (DISTINCT id)
FROM User

x. Friend = 11 (FK)

SELECT COUNT (DISTINCT user_id)
FROM Friend

xi. Elite_years = 2780 (FK)

SELECT COUNT (DISTINCT user_id)
FROM Elite_Years

SELECT COUNT (DISTINCT business_id)
FROM Attribute

vi. Checkin = 493 (FK)
SELECT COUNT (DISTINCT business_id)
FROM Checkin

3. Are there any columns with null values in the Users table? Indicate "yes," or "no."Answer:
No. There aren’t NULL values for the columns in the User table.

SQL code used to arrive at answer:

SELECT *
FROM USER
WHERE id IS NULL or
    name IS NULL or
    review_count IS NULL or 
    yelping_since IS NULL 
    or useful IS NULL or
    funny IS NULL or
    cool IS NULL or
    fans IS NULL or 
    average_stars IS NULL or 
    compliment_hot IS NULL or 
    compliment_more IS NULL or 
    compliment_profile IS NULL or 
    compliment_cute IS NULL or 
    compliment_list IS NULL or 
    compliment_note IS NULL or 
    compliment_plain IS NULL or 
    compliment_cool IS NULL or 
    compliment_funny IS NULL or 
    compliment_writer IS NULL or 
    compliment_photos IS NULL

4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

i. Table: Review, Column: Stars
min: 1 
max: 5 
avg: 3.7082

SELECT MIN(Stars) minimum, MAX(Stars) maximum, AVG(Stars) average
FROM Review

ii. Table: Business, Column: Stars
min: 1.0 
max: 5.0 
avg: 3.6549

SELECT MIN(Starts) minimum, MAX(Starts) maximum, AVG(Starts) average
FROM Business

iii. Table: Tip, Column: Likes
min: 0
max: 2
avg: 0.0144

SELECT MIN(Likes) minimum, MAX(Likes) maximum, AVG(Likes) average 
FROM Tip

iv. Table: Checkin, Column: Count
min: 1
max: 53 
avg: 1.9414

SELECT MIN(Count) minimum, MAX(Count) maximum, AVG(Count) average 
FROM Checkin

v. Table: User, Column: Review_count
min: 0 
max: 2000 
avg: 24.2995

SELECT MIN(Review_count) minimum, MAX(Review_count) maximum, AVG(Review_count) average
FROM User

5. List the cities with the most reviews in descending order:

SQL code used to arrive at answer:

SELECT city, SUM(review_count) total_review_count FROM Business
GROUP BY city
ORDER BY total_review_count DESC


6. Find the distribution of star ratings to the business in the following cities:

i. Avon
SQL code used to arrive at answer:

SELECT stars, COUNT(*) total_stars 
FROM business
WHERE city='Avon'
GROUP BY stars

ii. Beachwood
SQL code used to arrive at answer:

SELECT stars, COUNT(*) total_stars 
FROM business
WHERE city='Beachwood' 
GROUP BY stars

7. Find the top 3 users based on their total number of reviews:

SQL code used to arrive at answer:

SELECT id, name, review_count
FROM user
ORDER BY review_count DESC 
LIMIT 3

8. Does posing more reviews correlate with more fans? Please explain your findings and interpretation of the results:
To calculate the correlation, we are going to the Pearson Coefficient formula. Then, the correlation between reviews and fans is positive. However, it is a weak correlation. To the correlation being considered as strong, it should be greater than 0.5.

SELECT AVG((review_count - avg_x) * (fans - avg_y) )*AVG( (review_count - avg_x) * (fans - avg_y) )/(var_x*var_y) AS R
FROM USER, (SELECT
            avg_x,
            avg_y,
            AVG((review_count - avg_x)*(review_count - avg_x)) AS var_x, AVG((fans - avg_y)*(fans - avg_y)) AS var_y
                FROM USER, (SELECT
                AVG(review_count) AS avg_x,
                AVG(fans) AS avg_y
                FROM USER)
            );

9. Are there more reviews with the word "love" or with the word "hate" in them? Answer:
According the text review, the users have used the word “love” 1780 times, and “hate” 232 times only.

SQL code used to arrive at answer:

SELECT COUNT(*) AS love_count, (
    SELECT COUNT(*)
    FROM review
    WHERE text LIKE '%hate%') AS hate_count
FROM review
WHERE text LIKE '%love%'

10. Find the top 10 users with the most fans:

SQL code used to arrive at answer:

SELECT id, name, fans
FROM user
ORDER BY fans DESC
LIMIT 10


Part 2: Inferences and Analysis

1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.
  
  City: Las Vegas
  Category: Restaurant

i. Do the two groups you chose to analyze have a different distribution of hours?
No, both cases (2-3 and 4-5 stars) have the same operational hours.

ii. Do the two groups you chose to analyze have a different number of reviews?
Yes, the 4-5 stars group has a total of 939 review while 2-3 stars groups has only 123 reviews.

iii. Are you able to infer anything from the location data provided between these two groups? Explain.
When locating their addresses in the Las Vegas map, we are able to infer that 4-5 stars businesses are in touristic zones or commercial centers in the city, which are prone to have a heavy people traffic. Therefore, it will receive more reviews. Meanwhile, 2-3 stars is in residential area.
 
SQL code used for analysis:

SELECT b.name,
      b.address,
      b.city,
      b.state,
      b.stars,
      b.review_count,
      (SELECT h.hours
        FROM hours h
        LEFT JOIN business b ON h.business_id=b.id) AS hours_open
FROM business b
LEFT JOIN category c ON c.business_id=b.id 
WHERE b.city LIKE 'Las Vegas'
    AND b.stars BETWEEN 2 AND 3
    AND c.category LIKE 'Restaurants'

2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.

i. Difference 1:
All restaurants that have been closed had shorter working hours.

ii. Difference 2:
Toronto is the city with biggest number of open stores in the top 5. However, it is the one that least closed businesses, according to the dataset.

SQL code used for analysis:

-- Closed businesses
SELECT b.city, b.state, COUNT(*), AVG(b.review_count), AVG(b.stars), h.hours 
FROM ((business b INNER JOIN hours h ON b.id=h.business_id)
INNER JOIN category c ON b.id=c.business_id)
WHERE is_open =0
GROUP BY b.city
ORDER BY COUNT(*) DESC
LIMIT 5

-- Opened businesses
SELECT b.city, b.state, COUNT(*), AVG(b.review_count), AVG(b.stars), h.hours 
FROM ((business b INNER JOIN hours h ON b.id=h.business_id)
INNER JOIN category c ON b.id=c.business_id)
WHERE is_open =1
GROUP BY b.city
ORDER BY COUNT(*) DESC
LIMIT 5
 
 
3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.
Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:

i. Indicate the type of analysis you chose to do:
In this section, it will be performed a correlation analysis between the number of stars that a business has in relation to the number of like. The purpose is to understand, what is the strength between these two parameters.

ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:
For this analysis, we will retrieve data from the “review” and “tip” tables. Then, we are going to calculate the Pearson Coefficient formula to figure out the correlation coefficient. If the coefficient is positive, it means that the number of likes will be high if the stars qualification is high. The opposite happens in case the coefficient is negative. The coefficient's strength is measured by considering a solid correlation when the value gets closer to -1 or 1. Therefore, if the value is close to 0, the two variables do not have any correlation.

iii. Output of your finished dataset:
There is no correlation between the business stars qualification with the number of likes.

iv. Provide the SQL code you used to create your final dataset:
 
SELECT AVG((r.stars - avg_x) * (t.likes - avg_y) )*AVG( (r.stars - avg_x) * (t.likes - avg_y) )/(var_x*var_y) AS R
FROM review r INNER JOIN tip t ON r.user_id = t.user_id, 
      (SELECT avg_x,
          avg_y,
          AVG((r.stars - avg_x)*(r.stars - avg_x)) AS var_x,
          AVG((t.likes - avg_y)*(t.likes - avg_y)) AS var_y
          FROM review r INNER JOIN tip t ON r.user_id = t.user_id, 
            (SELECT
                AVG(r.stars) AS avg_x,
                AVG(t.likes) AS avg_y
                FROM review r INNER JOIN tip t ON r.user_id = t.user_id)
                );
