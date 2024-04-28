-- Problem Statement: Your task is to populate the Members and WorkoutSessions tables with relevant data. This will involve 
-- inserting records into both tables while ensuring data integrity and consistency.
-- Expected Outcome: New member records are successfully added to the Members table with their respective details.

-- INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
-- VALUES ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');

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
