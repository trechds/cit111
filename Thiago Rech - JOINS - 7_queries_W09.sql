USE v_art;

-- Query 1
SELECT LOWER(CONCAT(artfile)) AS artfile
FROM artwork
WHERE LOWER(period) = 'impressionism';

-- Query 2
SELECT DISTINCT LOWER(CONCAT(artfile)) AS artfile
FROM artwork
JOIN artwork_keyword USING (artwork_id)
JOIN keyword USING (keyword_id)
WHERE LOWER(keyword) LIKE '%flower%';

-- Query 3
SELECT artist.fname, artist.lname, artwork.title
FROM artist
LEFT JOIN artwork ON artist.artist_id = artwork.artist_id;


USE magazine;

-- Query 4
SELECT m.magazineName, s.subscriberLastName, s.subscriberFirstName
FROM subscription sub
JOIN magazine m ON sub.magazineKey = m.magazineKey
JOIN subscriber s ON sub.subscriberKey = s.subscriberKey
ORDER BY m.magazineName ASC;

-- Query 5
SELECT m.magazineName
FROM subscription sub
JOIN magazine m ON sub.magazineKey = m.magazineKey
JOIN subscriber s ON sub.subscriberKey = s.subscriberKey
WHERE s.subscriberLastName = 'Sanders' AND s.subscriberFirstName = 'Samantha';


USE employees;

-- Query 6
SELECT e.first_name, e.last_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Customer Service'
ORDER BY e.last_name
LIMIT 5;

-- Query 7
SELECT e.first_name, e.last_name, d.dept_name, s.salary, s.from_date
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
JOIN salaries s ON e.emp_no = s.emp_no
WHERE e.first_name = 'Berni' AND e.last_name = 'Genin'
ORDER BY s.to_date DESC
LIMIT 1;




















