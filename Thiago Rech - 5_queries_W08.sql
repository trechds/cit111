-- USING MAGAZINE DATABASE
USE magazine;

-- Query 1 - Magazine Discount: Retrieve magazine names and prices with a 3% discount rounded to 2 decimal places.
SELECT magazineName,
	CONCAT('$', ROUND(magazinePrice - magazinePrice * 0.03, 2)) AS '3% off'
FROM magazine;

-- Query 2 - Subscription Years: Display subscriber IDs and the rounded years since subscription started as of 2020-12-20.
SELECT subscriberKey,
    ROUND(DATEDIFF('2020-12-20', subscriptionStartDate) / 365) AS 'Years since subscription'
FROM subscription;

-- Query 3 - Subscription End Date: Show subscription start date, length, and calculate the formatted end date.
SELECT subscriptionStartDate, subscriptionLength,
    DATE_FORMAT(DATE_ADD(subscriptionStartDate, INTERVAL subscriptionLength MONTH), '%M %e, %Y') AS 'Subscription end'
FROM subscription;


-- USING BIKE DATABASE --
USE bike;

-- Query 4 - Products Without Year: List products without the year from the product_name, ordered by product_id (limit 14).
SELECT 
    TRIM(SUBSTRING_INDEX(product_name, ' ', LENGTH(product_name) - LENGTH(REPLACE(product_name, ' ', '')) - 1))
    AS 'Product Name without Year'
FROM product
ORDER BY product_id
LIMIT 14;

-- Query 5 - 2019 Bikes Payments: Display 2019 model bikes names and one-third of their prices as formatted payments.
SELECT product_name,
    CONCAT('$', FORMAT(list_price / 3, 2)) AS 'One of 3 payments'
FROM product
WHERE product_name LIKE '%2019%'
ORDER BY product_id;



