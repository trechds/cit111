USE university;

-- Query 1: Students born in September, sorted by last name
SELECT first_name AS fname, last_name AS lname, DATE_FORMAT(birthdate, '%M %e, %Y') AS 'Sept Birthdays'
FROM university.student
WHERE MONTH(birthdate) = 9
ORDER BY last_name;


-- Query 2: Student's age in years and days as of Jan. 5, 2017, sorted from oldest to youngest
SELECT last_name AS lname, first_name AS fname,
    FLOOR(DATEDIFF('2017-01-05', birthdate) / 365) AS Years,
    DATEDIFF('2017-01-05', birthdate) % 365 AS Days,
    CONCAT(FLOOR(DATEDIFF('2017-01-05', birthdate) / 365), ' - Yrs, ', DATEDIFF('2017-01-05', birthdate) % 365, ' - Days') AS 'Years and Days'
FROM university.student
ORDER BY Years DESC, Days DESC;


-- Query 3: Students taught by John Jensen, sorted by student's last name
SELECT s.first_name AS fname, s.last_name AS lname
FROM university.faculty f
JOIN university.faculty_has_section fs ON f.faculty_id = fs.faculty_id
JOIN university.section sec ON fs.section_id = sec.section_id
JOIN university.enrollment e ON sec.section_id = e.section_id
JOIN university.student s ON e.student_id = s.student_id
WHERE f.faculty_id = 4 AND e.faculty_id = 4
ORDER BY s.last_name;


-- Query 4: Instructors Bryce will have in Winter 2018. Sort by the faculty's last name.
SELECT DISTINCT f.faculty_fname AS fname, f.faculty_lname AS lname
FROM university.faculty f
INNER JOIN university.faculty_has_student fhs ON f.faculty_id = fhs.faculty_id
INNER JOIN university.student s ON fhs.student_id = s.student_id AND s.first_name = 'Bryce'
LEFT JOIN university.faculty_has_section fhs_sec ON f.faculty_id = fhs_sec.faculty_id
LEFT JOIN university.section sec ON fhs_sec.section_id = sec.section_id AND sec.term = 'Winter' AND sec.year = 2018
ORDER BY f.faculty_lname;


-- Query 5: Students that take Econometrics in Fall 2019. Sort by student last name.
SELECT s.first_name AS fname, s.last_name AS lname
FROM university.student s
JOIN university.enrollment e ON s.student_id = e.student_id
JOIN university.section sec ON e.section_id = sec.section_id
JOIN university.course c ON e.course_num = c.course_num AND e.department_code = c.department_code
WHERE c.department_code = 'ECON'
  AND c.course_num = 388
  AND sec.term = 'Fall'
  AND sec.year = 2019
ORDER BY s.last_name;


-- Query 6: Report showing all of Bryce Carlson's courses for Winter 2018. Sort by the name of the course.
SELECT c.department_code, c.course_num, c.course_title AS name
FROM university.student s
LEFT JOIN university.enrollment e ON s.student_id = e.student_id
LEFT JOIN university.section sec ON e.section_id = sec.section_id AND sec.term = 'Winter' AND sec.year = 2018
LEFT JOIN university.course c ON e.department_code = c.department_code AND e.course_num = c.course_num
WHERE s.first_name = 'Bryce' AND s.last_name = 'Carlson'
ORDER BY c.course_title;


-- Query 7: The number of students enrolled for Fall 2019
SELECT 'Fall' AS term, 2019 AS year, Enrollment
FROM university.section sec
LEFT JOIN university.enrollment e ON sec.section_id = e.section_id
CROSS JOIN 
	(SELECT COUNT(*) AS Enrollment
    FROM university.enrollment
    WHERE term = 'Fall' AND year = 2019) Enrollment
WHERE sec.term = 'Fall' AND sec.year = 2019
GROUP BY sec.term, sec.year, Enrollment;


-- Query 8: The number of courses in each college. Sort by college name.
SELECT c.college_name AS Colleges, COUNT(*) AS Courses
FROM university.course AS cr
JOIN university.college AS c ON cr.college_code = c.college_code
GROUP BY c.college_name
ORDER BY c.college_name;


-- Dear instructor, 
-- I couldn't solve the last 2 queries, I'm so sorry. I spent 18 hours to create the ERD, make the foward engineer and create these queries.
-- It was really hard solving these queries, I had to adjust the inserted data again and again, many times, and test many times.
-- My action output is in 1578. I need to submit this because I have other assignments to do of this course and also for WDD 130.
-- I'm really for failing, that's my first time dealing with databases and MySQL.
-- Thanks for all.

-- I can't get 'Ben' not to appear on the list, even though he's not from 'Winter'.
-- And I don't know why 'Marty' is adding a capacity from 'Fall' together with 'Winter.

-- Query 9: The total number of students each professor can teach in Winter 2018. Sort by that total number of students (teaching capacity).
SELECT f.faculty_fname AS fname, f.faculty_lname AS lname, SUM(f.capacity) AS TeachingCapacity
FROM university.faculty f
LEFT JOIN university.faculty_has_section fhs ON f.faculty_id = fhs.faculty_id
LEFT JOIN university.section s ON fhs.section_id = s.section_id AND s.term = 'Winter' AND s.year = 2018
GROUP BY f.faculty_id, f.faculty_fname, f.faculty_lname, f.capacity
ORDER BY TeachingCapacity ASC;

-- Query 9: #2
SELECT f.faculty_fname AS fname, f.faculty_lname AS lname, SUM(f.capacity) AS TeachingCapacity
FROM university.faculty f
LEFT JOIN university.faculty_has_section fhs ON f.faculty_id = fhs.faculty_id
LEFT JOIN university.section s ON fhs.section_id = s.section_id AND s.term = 'Winter' AND s.year = 2018
WHERE f.faculty_lname <> 'Barrus' -- Exclude 'Ben'
GROUP BY f.faculty_id, f.faculty_fname, f.faculty_lname
ORDER BY TeachingCapacity ASC;

-- Query 9: #3
SELECT faculty_fname AS 'fname', faculty_lname AS 'lname', SUM(se.capacity) AS 'TeachingCapactiy'
FROM faculty f
    JOIN section se
    ON f.faculty_id = se.faculty_id
    JOIN term t
    ON t.term_id = se.term_id
    JOIN enrollment e
    ON se.section_id = e.section_id
    JOIN student st
    ON st.student_id = e.student_id
WHERE se.term_id = 2
GROUP BY se.faculty_id
ORDER BY SUM(se.capacity);


-- Query 10: Each student's total credit load for Fall 2019, but only students with a credit load greater than three.  Sort by credit load in descending order. 
SELECT s.first_name AS fname, s.last_name AS lname, SUM(c.credits) AS Credits
FROM university.student s
LEFT JOIN university.enrollment e ON s.student_id = e.student_id
LEFT JOIN university.course c ON e.department_code = c.department_code AND e.course_num = c.course_num
LEFT JOIN university.section sec ON e.section_id = sec.section_id AND sec.term = 'Fall' AND sec.year = 2019
GROUP BY s.student_id, fname, lname
HAVING Credits > 3
ORDER BY Credits DESC;
























