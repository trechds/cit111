USE v_art;

SELECT * FROM artwork;

# filter with a range
SELECT title, period, artyear
FROM artwork
WHERE artyear > 1800 AND artyear < 1900;

-- another way to get a filter with range
SELECT title, period, artyear
FROM artwork
WHERE artyear BETWEEN 1800 AND 1900;

SELECT title, period
FROM artwork
WHERE period IN ('Modern', 'Baroque', 'Impressionism');

SELECT title, period
FROM artwork
WHERE period LIKE '%impression%';

SELECT title, period
FROM artwork
WHERE period LIKE '_ost-impression%';

SELECT title, period
FROM artwork
WHERE period REGEXP 'ism$';

SELECT title, period
FROM artwork
WHERE title REGEXP 'the|in|on';

SELECT * FROM artist;

SELECT fname, mname, lname
FROM artist;

SELECT fname As First, mname As Middle, lname As Last
FROM artist
WHERE mname IS NOT NULL
ORDER BY Middle;

USE bike;

SELECT * FROM prodcut;

SELECT  product_name, model_year, ROUND(list_price)
FROM product;

SELECT  product_name, model_year, ROUND(list_price) AS 'Rounded Price'
FROM product;

SELECT  product_name, model_year, list_price + 100 AS 'Marked up Price', list_price
FROM product;

SELECT  product_name, model_year, list_price + 100 AS 'Marked up Price', list_price
FROM product
WHERE list_price + 100 > 1000;

SELECT  product_name, model_year, list_price + 100 AS marked_up, list_price
FROM product
WHERE list_price + 100 > 1000
ORDER BY marked_up; 

SELECT product_name, model_year
FROM product
WHERE product_name LIKE 'Trek%';

SELECT product_name, model_year
FROM product
WHERE product_name LIKE 'Trek%' OR product_name LIKE 'Surly%';

SELECT product_name, model_year
FROM product
WHERE product_name LIKE 'Trek%' AND product_name LIKE 'Surly%';

SELECT product_name, model_year
FROM product
WHERE product_name LIKE 'Trek%' OR product_name LIKE 'Surly%' AND model_year <> 2016;

SELECT product_name, model_year
FROM product
WHERE (product_name LIKE 'Trek%' OR product_name LIKE 'Surly%') AND model_year <> 2016;

SELECT product_name, model_year
FROM product
WHERE (product_name LIKE 'Trek%' OR product_name LIKE 'Surly%') OR model_year <> 2016;



USE bike;
SELECT customer_id, first_name, last_name, email
FROM customer
WHERE email LIKE '%@gmail.com';

USE bike;
SELECT cust_order_id, order_date
FROM cust_order
WHERE MONTH (order_date) = 2 AND YEAR (order_date) = 2017;
