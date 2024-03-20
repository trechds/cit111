USE bike;

-- Query 1
SELECT ROUND(AVG(quantity)) AS 'Stock Average'
FROM stock;

-- Query 2
SELECT DISTINCT p.product_name
FROM product p
JOIN stock s ON p.product_id = s.product_id
WHERE s.quantity = 0
ORDER BY p.product_name;

-- Query 3
SELECT c.category_name, COUNT(*) AS 'instock'
FROM category c
JOIN product p ON c.category_id = p.category_id
JOIN stock s ON p.product_id = s.product_id
JOIN store st ON s.store_id = st.store_id
WHERE st.store_id = 2
GROUP BY c.category_name
ORDER BY instock;


USE employees;

-- Query 4
SELECT COUNT(*) AS 'Number of Employees'
FROM employees;

-- Query 5
SELECT d.dept_name, FORMAT(AVG(s.salary), 2) AS average_salary
FROM departments d
JOIN dept_emp de ON d.dept_no = de.dept_no
JOIN salaries s ON de.emp_no = s.emp_no
GROUP BY d.dept_no, d.dept_name
HAVING AVG(s.salary) < 60000;
    
-- Query 6
SELECT d.dept_name, COUNT(e.emp_no) AS 'Number of Females'
FROM departments d
JOIN dept_emp de ON d.dept_no = de.dept_no
JOIN employees e ON de.emp_no = e.emp_no
WHERE e.gender = 'F'
GROUP BY d.dept_no, d.dept_name
ORDER BY d.dept_name;




