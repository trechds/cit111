CREATE SCHEMA university;

USE university;

CREATE TABLE College (
    college_code VARCHAR(5) PRIMARY KEY,
    college_name VARCHAR(255)
);

CREATE TABLE Department (
    department_code VARCHAR(5) PRIMARY KEY,
    department_name VARCHAR(255),
    college_code VARCHAR(5),
    FOREIGN KEY (college_code) REFERENCES College(college_code)
);

CREATE TABLE Course (
    course_num INT PRIMARY KEY,
    course_title VARCHAR(255),
    credits INT
);

CREATE TABLE Section (
    section_id INT PRIMARY KEY,
    course_num INT,
    term VARCHAR(10),
    year INT,
    capacity INT,
    FOREIGN KEY (course_num) REFERENCES Course(course_num)
);

CREATE TABLE Faculty (
    faculty_id INT PRIMARY KEY,
    faculty_fname VARCHAR(255),
    faculty_lname VARCHAR(255)
);

CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    gender CHAR(1),
    city VARCHAR(255),
    state CHAR(2),
    birthdate DATE
);

CREATE TABLE Enrollment (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    section_id INT,
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (section_id) REFERENCES Section(section_id)
);

CREATE TABLE Faculty_Section (
    faculty_id INT,
    section_id INT,
    PRIMARY KEY (faculty_id, section_id),
    FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id),
    FOREIGN KEY (section_id) REFERENCES Section(section_id)
);







-- Insert College Data
INSERT INTO University.College (college_code, college_name) VALUES
('CPS&E', 'College of Physical Science and Engineering'),
('CB&C', 'College of Business and Communication'),
('CLL', 'College of Language and Letters');

-- Insert Department Data
INSERT INTO University.Department (department_code, department_name, college_code) VALUES
('CIT', 'Computer Information Technology', 'CPS&E'),
('ECON', 'Economics', 'CB&C'),
('HUM', 'Humanities and Philosophy', 'CLL');

-- Insert Course Data
INSERT INTO University.Course (course_num, course_title, credits) VALUES
(111, 'Intro to Databases', 3),
(388, 'Econometrics', 4),
(150, 'Micro Economics', 3),
(376, 'Classical Heritage', 2);

-- Insert Section Data
INSERT INTO University.Section (section_id, course_num, term, year, capacity) VALUES
(1, 111, 'Fall', 2019, 30),
(2, 388, 'Fall', 2019, 50),
(3, 111, 'Winter', 2018, 35);

-- Insert Faculty Data
INSERT INTO University.Faculty (faculty_id, faculty_fname, faculty_lname) VALUES
(1, 'Marty', 'Morring'),
(2, 'Nate', 'Nathan'),
(3, 'Ben', 'Barrus'),
(4, 'John', 'Jensen'),
(5, 'Bill', 'Barney');

-- Insert Student Data
INSERT INTO University.Student (student_id, first_name, last_name, gender, city, state, birthdate) VALUES
(1, 'Paul', 'Miller', 'M', 'Dallas', 'TX', '1996-02-22'),
(2, 'Katie', 'Smith', 'F', 'Provo', 'UT', '1995-07-22'),
(3, 'Kelly', 'Jones', 'F', 'Provo', 'UT', '1998-06-22'),
(4, 'Devon', 'Merrill', 'M', 'Mesa', 'AZ', '2000-07-22'),
(5, 'Mandy', 'Murdock', 'F', 'Topeka', 'KS', '1996-11-22'),
(6, 'Alece', 'Adams', 'F', 'Rigby', 'ID', '1997-05-22'),
(7, 'Bryce', 'Carlson', 'M', 'Bozeman', 'MT', '1997-11-22'),
(8, 'Preston', 'Larsen', 'M', 'Decatur', 'TN', '1996-09-22'),
(9, 'Julia', 'Madsen', 'F', 'Rexburg', 'ID', '1998-09-22'),
(10, 'Susan', 'Sorensen', 'F', 'Mesa', 'AZ', '1998-08-09');

-- Insert Enrollment Data
INSERT INTO University.Enrollment (enrollment_id, student_id, section_id) VALUES
(1, 6, 1),
(2, 7, 2),
(3, 7, 3),
(4, 7, 1),
(5, 4, 1),
(6, 9, 2),
(7, 2, 2),
(8, 3, 2),
(9, 5, 2),
(10, 5, 1),
(11, 1, 1),
(12, 1, 2),
(13, 8, 3),
(14, 10, 2);