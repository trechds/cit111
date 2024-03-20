USE datawinter;

SELECT * FROM student;

SELECT lname, fname, major
FROM student
WHERE major = 'CIT'
ORDER BY lname;

SELECT  lname, fname
FROM student 
WHERE worry_category =  'family';









-- What is the biggest distraction?
SELECT worry_category, COUNT(*)
FROM student
GROUP BY worry_category
ORDER BY COUNT(*) DESC;







-- Which grou in section 1 had the most selfies?
SELECT group_name, COUNT(type)
FROM student_group JOIN student
	ON student_group.group_id = student.group_id
    JOIN image
    ON student.student_id = image.student_id
WHERE student_group.location LIKE  "%1" AND type="selfie"
GROUP BY group_name
ORDER BY COUNT(type) DESC;