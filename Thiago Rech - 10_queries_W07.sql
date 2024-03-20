-- Working with the database v_art
USE v_art; 

-- Query 1: Inserting the Artist Johannes Vermeer
INSERT INTO artist (fname, lname, dob, country, dod, local)
VALUES ('Johannes', 'Vermeer', 1632, 'Netherlands', 1674, 'n');

-- Query 2: Listing all Artists Sorted by Last Name
SELECT *
FROM artist
ORDER BY lname;

-- Query 3: Editing the Artist Information
UPDATE artist
SET dod = 1675
WHERE artist_id = 10;

-- Query 4: Deleting Artist (Johannes Vermeer)
DELETE FROM artist
WHERE artist_id = 10;


-- Working with the database bike
USE bike;

-- Query 5: Selecting first names, last names, and phone numbers of customers from Houston, Texas
SELECT first_name, last_name, phone
FROM customer
WHERE city = 'Houston';

-- Query 6: Applying a discount of $500 to high-end bikes and listing the bike name, list price, and discount price
SELECT product_name, list_price, (list_price - 500) AS "Discount Price"
FROM product
WHERE list_price >= 5000
ORDER BY list_price DESC;

-- Query 7: Retrieving a list of staff (excluding store_id 1) with their email addresses
SELECT first_name, last_name, email
FROM staff
WHERE store_id <> 1;

-- Query 8: Searching for the keyword 'spider' to obtain the information of a specific bike
SELECT product_name AS name, model_year, list_price
FROM product
WHERE product_name LIKE '%spider%';

-- Query 9: Listing the bikes within the price range of $500 – $550
SELECT product_name, list_price
FROM product
WHERE list_price BETWEEN 500.00 AND 550.00
ORDER BY list_price;

-- Query 10: Getting customer information based on specified conditions
SELECT first_name, last_name, phone, street, city, state, zip_code
FROM customer
WHERE phone IS NOT NULL
    AND (city LIKE '%ach%' OR city LIKE '%och%') OR last_name = 'William'
LIMIT 5;



