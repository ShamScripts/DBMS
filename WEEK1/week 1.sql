USE 20230009db;
CREATE TABLE ADMISSION (No INT , Name CHAR(20), Age INT, Department CHAR(30), DATEOFADMISSION DATE, Fee INT, SEX CHAR(1));
SHOW TABLES;
DESCRIBE ADMISSION;
INSERT INTO ADMISSION (No, Name, Age, Department, DATEOFADMISSION, Fee, SEX) VALUES 
(1, 'Pankaj', 24, 'Computer', '2002-10-12', 120, 'M'),
(2, 'Shalini', 21, 'History', '2012-02-25', 200, 'F'),
(3, 'Sanjay', 22, 'HINDI', '2010-10-10', 300, 'F'),
(4, 'Sudha', 25, 'History', '2015-05-30', 400, 'F'),
(5, 'Rakesh', 22, 'Hindi', '2012-12-12', 250, 'M'),
(6, 'Shakeel', 30, 'History', '2016-01-03', 300, 'M'),
(7, 'Surya', 34, 'Computer', '2013-03-30', 210, 'M');
SELECT * FROM ADMISSION;
UPDATE ADMISSION 
SET Age = 27 
WHERE Name = 'Pankaj';
SELECT * FROM ADMISSION;
UPDATE ADMISSION 
SET Fee = 425 
WHERE Name = 'Sudha';
SELECT * FROM ADMISSION;
ALTER TABLE ADMISSION
ADD CITY VARCHAR(30);
ALTER TABLE ADMISSION
DROP CITY;
SELECT * FROM ADMISSION;

CREATE TABLE pet (name VARCHAR(20), owner VARCHAR(20),
species VARCHAR(20), sex CHAR(1), birth DATE, death DATE);

INSERT INTO pet VALUES
('Fluffy', 'Harold', 'cat', 'f', '1993-02-04', NULL),
('Claws', 'Gwen', 'cat', 'm', '1994-03-17', NULL),
('Buffy', 'Harold', 'dog', 'f', '1989-05-13', NULL),
('Fang', 'Benny', 'dog', 'm', '1990-08-27', '1995-07-29'),
('Bowser', 'Diane', 'dog', 'm', '1979-08-31', NULL),
('Chirpy', 'Gwen', 'bird', 'f', '1998-09-11', NULL),
('Slim', 'Benny', 'snake', 'm', '1996-04-29', NULL),
('Whistler', 'Gwen', 'bird', NULL, '1996-04-29', NULL),
('Puffball', 'Diane', 'hamster', 'f', '1999-03-30', NULL);

SELECT * FROM pet WHERE name = 'Fang';

SELECT * FROM pet WHERE owner = 'Gwen';

SELECT owner FROM pet WHERE species = 'dog';

SELECT * FROM pet WHERE sex = 'f';

SELECT birth FROM pet WHERE species = 'hamster';
