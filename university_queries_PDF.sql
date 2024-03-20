-- QUERIES TO SHOW THE DATA AS THE PDF --

-- Catalog View
SELECT
    c.college_name AS 'college',
    d.department_name AS 'department',
    d.department_code,
    co.course_num,
    co.course_title,
    co.credits
FROM university.college c
LEFT JOIN university.department d ON c.college_code = d.college_code
LEFT JOIN university.course co ON d.department_code = co.department_code;


-- Section View 
SELECT
    s.year,
    s.term,
    CONCAT(c.department_code, ' ', c.course_num) AS course,
    s.section_id AS section,
    f.faculty_fname AS faculty_fname,
    f.faculty_lname AS faculty_lname,
    s.capacity
FROM university.section s
    LEFT JOIN university.section_has_course sc ON s.section_id = sc.section_id
    LEFT JOIN university.course c ON sc.course_num = c.course_num
    LEFT JOIN university.faculty_has_section fs ON s.section_id = fs.section_id
    LEFT JOIN university.faculty f ON fs.faculty_id = f.faculty_id
LIMIT 0, 1000;


-- Student View
SELECT
    first_name,
    last_name,
    gender,
    city,
    state,
    birthdate
FROM university.student
LIMIT 0, 1000;


-- Enrollment View
SELECT
    s.first_name,
    s.last_name,
    c.department_code,
    c.course_num,
    s2.term,
    s2.section_id
FROM university.student s
JOIN university.enrollment e ON s.student_id = e.student_id
JOIN university.section s2 ON e.section_id = s2.section_id
JOIN university.course c ON e.course_num = c.course_num AND e.department_code = c.department_code
LIMIT 0, 1000;