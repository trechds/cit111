-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema university
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `university` ;

-- -----------------------------------------------------
-- Schema university
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `university` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `university` ;

-- -----------------------------------------------------
-- Table `university`.`college`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`college` ;

CREATE TABLE IF NOT EXISTS `university`.`college` (
  `college_code` VARCHAR(5) NOT NULL,
  `college_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`college_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `university`.`department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`department` ;

CREATE TABLE IF NOT EXISTS `university`.`department` (
  `department_code` VARCHAR(5) NOT NULL,
  `department_name` VARCHAR(255) NOT NULL,
  `college_code` VARCHAR(5) NOT NULL,
  `college_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`department_code`),
  INDEX `college_code` (`college_code` ASC) VISIBLE,
  CONSTRAINT `department_ibfk_1`
    FOREIGN KEY (`college_code`)
    REFERENCES `university`.`college` (`college_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `university`.`course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`course` ;

CREATE TABLE IF NOT EXISTS `university`.`course` (
  `course_num` INT NOT NULL,
  `course_title` VARCHAR(255) NOT NULL,
  `credits` INT NOT NULL,
  `department_code` VARCHAR(5) NOT NULL,
  `college_code` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`course_num`),
  INDEX `fk_course_department1_idx` (`department_code` ASC) VISIBLE,
  INDEX `fk_course_college1_idx` (`college_code` ASC) VISIBLE,
  CONSTRAINT `fk_course_department1`
    FOREIGN KEY (`department_code`)
    REFERENCES `university`.`department` (`department_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_course_college1`
    FOREIGN KEY (`college_code`)
    REFERENCES `university`.`college` (`college_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `university`.`student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`student` ;

CREATE TABLE IF NOT EXISTS `university`.`student` (
  `student_id` INT NOT NULL,
  `first_name` VARCHAR(255) NOT NULL,
  `last_name` VARCHAR(255) NOT NULL,
  `gender` CHAR(1) NOT NULL,
  `city` VARCHAR(255) NOT NULL,
  `state` CHAR(2) NOT NULL,
  `birthdate` DATE NOT NULL,
  PRIMARY KEY (`student_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `university`.`section`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`section` ;

CREATE TABLE IF NOT EXISTS `university`.`section` (
  `section_id` INT NOT NULL,
  `section` INT NOT NULL,
  `term` VARCHAR(10) NOT NULL,
  `year` INT NOT NULL,
  `capacity` INT NOT NULL,
  `faculty_id` INT NOT NULL,
  PRIMARY KEY (`section_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `university`.`faculty`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`faculty` ;

CREATE TABLE IF NOT EXISTS `university`.`faculty` (
  `faculty_id` INT NOT NULL,
  `faculty_fname` VARCHAR(255) NOT NULL,
  `faculty_lname` VARCHAR(255) NOT NULL,
  `capacity` INT NOT NULL,
  PRIMARY KEY (`faculty_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `university`.`enrollment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`enrollment` ;

CREATE TABLE IF NOT EXISTS `university`.`enrollment` (
  `enrollment_id` INT NOT NULL,
  `student_id` INT NOT NULL,
  `section_id` INT NOT NULL,
  `department_code` VARCHAR(5) NOT NULL,
  `course_num` INT NOT NULL,
  `faculty_id` INT NOT NULL,
  `term` VARCHAR(10) NOT NULL,
  `year` INT NOT NULL,
  PRIMARY KEY (`enrollment_id`),
  INDEX `student_id` (`student_id` ASC) VISIBLE,
  INDEX `section_id` (`section_id` ASC) VISIBLE,
  INDEX `fk_enrollment_department1_idx` (`department_code` ASC) VISIBLE,
  INDEX `fk_enrollment_course1_idx` (`course_num` ASC) VISIBLE,
  INDEX `fk_enrollment_faculty1_idx` (`faculty_id` ASC) VISIBLE,
  CONSTRAINT `enrollment_ibfk_1`
    FOREIGN KEY (`student_id`)
    REFERENCES `university`.`student` (`student_id`),
  CONSTRAINT `enrollment_ibfk_2`
    FOREIGN KEY (`section_id`)
    REFERENCES `university`.`section` (`section_id`),
  CONSTRAINT `fk_enrollment_department1`
    FOREIGN KEY (`department_code`)
    REFERENCES `university`.`department` (`department_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_enrollment_course1`
    FOREIGN KEY (`course_num`)
    REFERENCES `university`.`course` (`course_num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_enrollment_faculty1`
    FOREIGN KEY (`faculty_id`)
    REFERENCES `university`.`faculty` (`faculty_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `university`.`course_has_student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`course_has_student` ;

CREATE TABLE IF NOT EXISTS `university`.`course_has_student` (
  `course_num` INT NOT NULL,
  `student_id` INT NOT NULL,
  PRIMARY KEY (`course_num`, `student_id`),
  INDEX `fk_course_has_student_student1_idx` (`student_id` ASC) VISIBLE,
  INDEX `fk_course_has_student_course1_idx` (`course_num` ASC) VISIBLE,
  CONSTRAINT `fk_course_has_student_course1`
    FOREIGN KEY (`course_num`)
    REFERENCES `university`.`course` (`course_num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_course_has_student_student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `university`.`student` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `university`.`faculty_has_section`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`faculty_has_section` ;

CREATE TABLE IF NOT EXISTS `university`.`faculty_has_section` (
  `faculty_id` INT NOT NULL,
  `section_id` INT NOT NULL,
  PRIMARY KEY (`faculty_id`, `section_id`),
  INDEX `fk_faculty_has_section_section1_idx` (`section_id` ASC) VISIBLE,
  INDEX `fk_faculty_has_section_faculty1_idx` (`faculty_id` ASC) VISIBLE,
  CONSTRAINT `fk_faculty_has_section_faculty1`
    FOREIGN KEY (`faculty_id`)
    REFERENCES `university`.`faculty` (`faculty_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_faculty_has_section_section1`
    FOREIGN KEY (`section_id`)
    REFERENCES `university`.`section` (`section_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `university`.`section_has_course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`section_has_course` ;

CREATE TABLE IF NOT EXISTS `university`.`section_has_course` (
  `section_id` INT NOT NULL,
  `course_num` INT NOT NULL,
  PRIMARY KEY (`section_id`, `course_num`),
  INDEX `fk_section_has_course_course1_idx` (`course_num` ASC) VISIBLE,
  INDEX `fk_section_has_course_section1_idx` (`section_id` ASC) VISIBLE,
  CONSTRAINT `fk_section_has_course_section1`
    FOREIGN KEY (`section_id`)
    REFERENCES `university`.`section` (`section_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_has_course_course1`
    FOREIGN KEY (`course_num`)
    REFERENCES `university`.`course` (`course_num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `university`.`faculty_has_student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`faculty_has_student` ;

CREATE TABLE IF NOT EXISTS `university`.`faculty_has_student` (
  `faculty_id` INT NOT NULL,
  `student_id` INT NOT NULL,
  PRIMARY KEY (`faculty_id`, `student_id`),
  INDEX `fk_faculty_has_student_student1_idx` (`student_id` ASC) VISIBLE,
  INDEX `fk_faculty_has_student_faculty1_idx` (`faculty_id` ASC) VISIBLE,
  CONSTRAINT `fk_faculty_has_student_faculty1`
    FOREIGN KEY (`faculty_id`)
    REFERENCES `university`.`faculty` (`faculty_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_faculty_has_student_student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `university`.`student` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;





-- INSERTING DATA INTO THE SCHEMA 'university' --

USE university;

-- Insert data in the table college
INSERT INTO university.college (college_code, college_name) VALUES
(1, 'College of Physical Science and Engineering'),
(2, 'College of Business and Communication'),
(3, 'College of Language and Letters');

-- Insert data in the table department
INSERT INTO university.department (department_code, department_name, college_code, college_name) VALUES
('CIT', 'Computer Information Technology', 1, 'College of Business and Communication'),
('ECON', 'Economics', 2, 'College of Language and Letters'),
('HUM', 'Humanities and Philosophy', 3, 'Physical Science and Engineering');

-- Insert data in the table course
INSERT INTO university.course (department_code, course_num, course_title, credits, college_code) VALUES
('CIT', 111, 'Intro to Databases', 3, 1),
('ECON', 388, 'Econometrics', 4, 2),
('ECON', 150, 'Micro Economics', 3, 2),
('HUM', 376, 'Classical Heritage', 2, 3);

-- Insert data in the table student
INSERT INTO university.student (student_id, first_name, last_name, gender, city, state, birthdate) VALUES
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

-- Insert data in the table course_has_student
INSERT INTO university.course_has_student (student_id, course_num) VALUES
(1, 111),
(1, 150),
(2, 388),
(3, 388),
(4, 376),
(5, 388),
(5, 376),
(6, 111),
(7, 111),
(7, 150),
(7, 376),
(8, 150),
(9, 150),
(10, 111);

-- Insert data in the table faculty
INSERT INTO university.faculty (faculty_id, faculty_fname, faculty_lname, capacity) VALUES
(1, 'Marty', 'Morring', 30),
(2, 'Nate', 'Nathan', 50),
(3, 'Ben', 'Barrus', 35),
(4, 'John', 'Jensen', 30),
(5, 'Bill', 'Barney', 35);

-- Insert data in the table section
INSERT INTO university.section (section_id, section, term, year, capacity, faculty_id) VALUES
(1, 1, 'Fall', 2019, 30, 1),
(2, 1, 'Fall', 2019, 35, 3),
(3, 1, 'Fall', 2019, 50, 2),
(4, 1, 'Winter', 2018, 30, 4),
(5, 1, 'Winter', 2018, 50, 2),
(6, 2, 'Fall', 2019, 50, 2),
(7, 2, 'Winter', 2018, 30, 1),
(8, 2, 'Winter', 2018, 50, 2),
(9, 3, 'Winter', 2018, 35, 5);

-- Insert data in the table section_has_course
INSERT IGNORE INTO university.section_has_course (section_id, course_num) VALUES
(1, 111),
(1, 150),
(2, 150),
(1, 388),
(1, 376),
(2, 111),
(3, 111),
(1, 150),
(2, 150),
(1, 376);

-- Insert data in the table faculty_has_section
INSERT INTO university.faculty_has_section (faculty_id, section_id) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(4, 1),
(5, 3);

-- Insert data in the table faculty_has_student
INSERT INTO university.faculty_has_student (student_id, faculty_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 3),
(4, 4),
(5, 3),
(5, 4),
(6, 5),
(7, 1),
(7, 2),
(7, 4),
(8, 2),
(9, 2),
(10, 1);

-- Insert data in the table enrollment
INSERT INTO university.enrollment (enrollment_id, student_id, section_id, department_code, course_num, faculty_id, term, year) VALUES
(1, 6, 3, 'CIT', 111, 5, 'Winter', 2018),
(2, 7, 2, 'CIT', 111, 1, 'Winter', 2018),
(3, 7, 1, 'ECON', 150, 2, 'Winter', 2018),
(4, 7, 1, 'HUM', 376, 4, 'Winter', 2018),
(5, 4, 1, 'HUM', 376, 4, 'Fall', 2019),
(6, 9, 1, 'ECON', 150, 2, 'Winter', 2018),
(7, 2, 1, 'ECON', 388, 3, 'Fall', 2019),
(8, 3, 1, 'ECON', 388, 3, 'Fall', 2019),
(9, 5, 1, 'ECON', 388, 3, 'Fall', 2019),
(10, 5, 1, 'HUM', 376, 4, 'Fall', 2019),
(11, 1, 1, 'CIT', 111, 1, 'Fall', 2019),
(12, 1, 2, 'ECON', 150, 2, 'Fall', 2019),
(13, 8, 2, 'ECON', 150, 2, 'Winter', 2018),
(14, 10, 2, 'CIT', 111, 1, 'Winter', 2018);






-- ***************** TESTING QUERIES ***************** --


-- DELETING THE DATA FROM THE TABLES --

-- Desativar o modo de atualização segura
SET SQL_SAFE_UPDATES = 0;

-- Deletar todos os dados das tabelas
DELETE FROM university.college;
DELETE FROM university.department;
DELETE FROM university.course;
DELETE FROM university.student;
DELETE FROM university.section;
DELETE FROM university.enrollment;
DELETE FROM university.faculty;
DELETE FROM university.course_has_student;
DELETE FROM university.faculty_has_section;
DELETE FROM university.faculty_has_student;
DELETE FROM university.section_has_course;

-- Ativar o modo de atualização segura novamente
SET SQL_SAFE_UPDATES = 1;


-- VISUALIZE THE DATA IN THE TABLES --

-- Visualize the data in college
SELECT * FROM university.college;

-- Visualize the data in department
SELECT * FROM university.department;

-- Visualize the data in course
SELECT * FROM university.course;

-- Visualize the data in student
SELECT * FROM university.student;

-- Visualize the data in section
SELECT * FROM university.section;

-- Visualize the data in faculty
SELECT * FROM university.faculty;

-- Visualize the data in faculty_has_section
SELECT * FROM university.faculty_has_section;

-- Visualize the data in faculty_has_student
SELECT * FROM university.faculty_has_student;

-- Visualize the data in enrollment
SELECT * FROM university.enrollment;

-- Visualize the data in section_has_course
SELECT * FROM university.section_has_course;
