-- ASSIGNMENT 1: DATABASE DEVELOPMENT FOR A MUSIC LIBRARY

CREATE TABLE Artists (
  id INT AUTO_INCREMENT,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  country VARCHAR(255) NOT NULL,
  state VARCHAR(255) NOT NULL,
  city VARCHAR(255) NOT NULL,
  start_year INT(4) NOT NULL,
  website VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE Genres (
  id INT AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  description VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE Albums (
  id INT AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  release_year INT(4) NOT NULL,
  total_tracks INT(4) NOT NULL,
  PRIMARY KEY (id)
);

ALTER TABLE Albums
ADD duration INT NOT NULL;

ALTER TABLE Albums
ADD FOREIGN KEY (artist_id) REFERENCES Artist(id);

ALTER TABLE Albums
ADD FOREIGN KEY (genre_id) REFERENCES Genres(id);

-- ASSIGNMENT 2: MANAGING A FITNESS CENTER DATABASE

-- Problem Statement: Your task is to populate the Members and WorkoutSessions tables with relevant data. This will involve 
-- inserting records into both tables while ensuring data integrity and consistency.
-- Expected Outcome: New member records are successfully added to the Members table with their respective details.

INSERT INTO Members (id, name, age, trainer_id)
VALUES ('1', 'John Doe', '34', '2'),
('2', 'Jane Susan', '28', '1'),
('3', 'Brayden Via', '43', '3'),
('4', 'Lily Justice', '33', '4');

CREATE TABLE WorkoutSessions (
	id INT NOT NULL AUTO_INCREMENT,
    type VARCHAR(255) NOT NULL,
    member_id INT,
    time VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (member_id) REFERENCES Members(id)
);

INSERT INTO WorkoutSessions (id, type, member_id, time)
VALUES ('1', 'upper body', '2', 'morning'),
('2', 'legs', '3', 'evening'),
('3', 'cardio', '1', 'afternoon'),
('4', 'cardio', '4', 'night');

-- Error Code: 1146. Table 'fitness_center.workoutsessions' doesn't exist


DROP TABLE WorkoutSessions;

ALTER TABLE WorkoutSessions 
ADD workout_time VARCHAR(255) NOT NULL;

-- ADD FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);

ALTER TABLE WorkoutSessions
ADD FOREIGN KEY (traner_id) references Trainers(id);

ALTER TABLE Members
ADD FOREIGN KEY (trainer_id) references Trainers(id);

-- ALTER TABLE table_name
-- ALTER COLUMN column_name datatype;

ALTER TABLE Members
MODIFY COLUMN id INT NOT NULL AUTO_INCREMENT;

ALTER TABLE Trainers
MODIFY COLUMN id INT NOT NULL AUTO_INCREMENT;

INSERT INTO Members (name, age, trainer_id)
VALUES ('Jane Doe', '23', '2');

INSERT INTO WorkoutSessions (type, member_id, time)
VALUES ('upper body', '5', 'morning');

UPDATE WorkoutSessions
SET time = 'night'
WHERE member_id = '5';

SET SQL_SAFE_UPDATES = 0;
SET FOREIGN_KEY_CHECKS=0;

DELETE FROM Members WHERE name='John Doe';

SET SQL_SAFE_UPDATES = 1;
SET FOREIGN_KEY_CHECKS=1;

SELECT * FROM Trainers;
SELECT * FROM Members;
SELECT * FROM WorkoutSessions;


-- ASSIGNMENT 3: SQL QUERY EXPLORATION IN EMPLOYEE DATABASE

CREATE DATABASE employee_db;

CREATE TABLE Departments (
      department_id INT AUTO_INCREMENT,
      department_name VARCHAR(100),
      PRIMARY KEY (department_id)
    );
    
CREATE TABLE Employees (
      employee_id INT AUTO_INCREMENT,
      name VARCHAR(100),
      age INT,
      department_id INT,
      PRIMARY KEY (employee_id),
      FOREIGN KEY (department_id) REFERENCES Departments(department_id)
    );


INSERT INTO Departments (department_name)
VALUES ('English'),
('Math'),
('Science');

INSERT INTO Employees (name, age, department_id)
VALUES ('Tim Greene', 35, 1),
('Brandi Conrad', 48, 2),
('Tiffany Len', 50, 3);

SELECT * FROM Departments;
SELECT * FROM Employees;

-- Problem Statement: Identify the distinct departments in which employees work.
-- Expected Outcome: A list of unique department names from the Employees table.

SELECT distinct department_name 
FROM Employees
JOIN Departments ON Employees.department_id = Departments.department_id;

-- Problem Statement: Count the total number of employees in each department. Investigate GROUP BY clause.
-- Expected Outcome: A count of employees grouped by their department.

SELECT COUNT(employee_id), department_id
FROM Employees
GROUP BY department_id;

-- Problem Statement: Retrieve the details of employees whose ages fall between 25 and 30.
-- Expected Outcome: A list of employees (including their names, ages, and department IDs) who are between the ages of 25 and 30.

SELECT * FROM Employees
WHERE age BETWEEN 35 AND 41;

