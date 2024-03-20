USE world;

-- Query 1
SELECT Name, population
FROM country c
WHERE population < 5000000;

-- Query 2
SELECT Language
FROM countrylanguage
ORDER BY Language ASC;

-- Query 3 
SELECT Continent, COUNT(Continent) AS 'Number of Countries'
FROM country
WHERE Continent = 'North America';

SELECT Continent, name
FROM country;

-- Query 4
SELECT Code, Name, FORMAT(AVG(Population)) AS 'Average Population'
FROM country
ORDER BY 'Avegare Population' ASC;

SELECT Code, Name, FORMAT(AVG(Population)) AS 'Average Population'
FROM country
WHERE Name = 'Liberia';



