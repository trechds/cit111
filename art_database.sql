USE art_database;

-- Adiciona a tabela artist
CREATE TABLE `art`.`artist` (
    `artist_id` INT PRIMARY KEY,
    `fname` VARCHAR(50),
    `mname` VARCHAR(50),
    `lname` VARCHAR(50),
    `dob` DATE,
    `dod` DATE,
    `country` VARCHAR(50),
    `local` VARCHAR(50)
);

-- Adiciona a tabela artwork
CREATE TABLE `art`.`artwork` (
    `artwork_id` INT PRIMARY KEY,
    `title` VARCHAR(100),
    `year` INT,
    `period` VARCHAR(50),
    `type` VARCHAR(50),
    `file` VARCHAR(100),
    `artist_id` INT,
    FOREIGN KEY (`artist_id`) REFERENCES `art`.`artist`(`artist_id`)
);

-- Adiciona a tabela keyword
CREATE TABLE `art`.`keyword` (
    `keyword_id` INT PRIMARY KEY,
    `keyword` VARCHAR(50)
);

-- Adiciona a tabela artwork_keyword
CREATE TABLE `art`.`artwork_keyword` (
    `artwork_id` INT,
    `keyword_id` INT,
    PRIMARY KEY (`artwork_id`, `keyword_id`),
    FOREIGN KEY (`artwork_id`) REFERENCES `art`.`artwork`(`artwork_id`),
    FOREIGN KEY (`keyword_id`) REFERENCES `art`.`keyword`(`keyword_id`)
);

USE art_database;
SHOW TABLES;

