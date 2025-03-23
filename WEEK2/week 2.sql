/*
1. Create a table for the following. department(dept_name, building, budget)
2. Alter the above table to add primary key.
3. Create the following tables with primary key and foreign key constraints
student(sid, name, dept_name, total_credit) FK: dept_name 
course(course_id, title, dept_name , credits) FK: dept_name 
instructor(iid, name, dept_name, salary) FK: dept_name 
teaches(iid, course_id, sec_id, semester, year) FK: course_id, iid 
takes(sid, course_id, sec_id, semester, year, grade)
adviser(sid, iid) FK: iid references instructor (iid), sid
references student (sid)
prereq( course_id, prereq_id) FK: course_id references course(course_id), prereq_id references course(course_id)
4. Alter the instructor table to set 10,0000/- as default salary.
5. Insert some rows into all of the above tables.
6. Insert a row into ‘takes’ table with the semester value as 3 or above and view the effect of constraints.
7. Delete some rows to view the effect of foreign key constraints.
8. TRUNCATE and DROP tables.
*/
----
USE 20230009db;

-- Creating tables

CREATE TABLE department(dept_name VARCHAR(20), building VARCHAR(20), budget DECIMAL(10,2));

ALTER TABLE department ADD PRIMARY KEY(dept_name);

CREATE TABLE student
(sid INT PRIMARY KEY, 
name VARCHAR(50), 
dept_name VARCHAR(50),
total_credit INT,
FOREIGN KEY(dept_name) REFERENCES department(dept_name) ON DELETE CASCADE);

CREATE TABLE course
(course_id VARCHAR(10) PRIMARY KEY, 
title VARCHAR(50),
dept_name VARCHAR(50),
credits INT,
FOREIGN KEY(dept_name) REFERENCES department(dept_name) ON DELETE CASCADE);

CREATE TABLE instructor
(iid INT PRIMARY KEY,
NAME VARCHAR(50),
dept_name VARCHAR(50),
salary INT,
FOREIGN KEY(dept_name) REFERENCES department(dept_name));

CREATE TABLE teaches
(iid INT,course_id VARCHAR(10),sec_id VARCHAR(10),
semester INT,YEAR INT,PRIMARY KEY(iid,course_id,sec_id,semester,YEAR),
FOREIGN KEY(iid) REFERENCES instructor(iid) ON DELETE CASCADE, 
FOREIGN KEY(course_id) REFERENCES course(course_id) ON DELETE CASCADE);


CREATE TABLE takes
(sid INT,
course_id VARCHAR(10),
sec_id VARCHAR(10),
semester INT,
YEAR INT,
GRADE CHAR(2),
PRIMARY KEY(sid,course_id,sec_id,semester,YEAR),
FOREIGN KEY(sid) REFERENCES student(sid) ON DELETE CASCADE, 
FOREIGN KEY(course_id) REFERENCES course(course_id) ON DELETE CASCADE);


CREATE TABLE advisor
(sid INT, iid INT, 
FOREIGN KEY(iid) REFERENCES instructor(iid) ON DELETE CASCADE,
FOREIGN KEY(sid) REFERENCES student(sid)ON DELETE CASCADE);

CREATE TABLE prereq
(course_id VARCHAR(10),prereq_id VARCHAR(10),
FOREIGN KEY(course_id) REFERENCES course(course_id),
FOREIGN KEY(prereq_id) REFERENCES course(course_id));

ALTER TABLE instructor MODIFY salary INT DEFAULT 100000;

-- Insertting zRecordz

INSERT INTO department VALUES
('COMPUTER SCIENCE', 'BLOCK A', 500000.00),
('MATHEMATICS', 'BLOCK B', 300000.00),
('PHYSICS', 'BLOCK C', 400000.00);

INSERT INTO student VALUES
(001, 'AARAV SHARMA', 'COMPUTER SCIENCE', 120),
(002, 'PRIYA VERMA', 'MATHEMATICS', 110),
(003, 'RAHUL NAIR', 'PHYSICS', 115);

INSERT INTO course VALUES
('CS101', 'INTRO TO CS', 'COMPUTER SCIENCE', 3),
('MATH201', 'CALCULUS 1', 'MATHEMATICS', 4),
('PHYS101', 'FUNDAMENTALS OF PHYSICS', 'PHYSICS', 3);

INSERT INTO instructor VALUES
(101, 'DR AMIT TRIVEDI', 'COMPUTER SCIENCE', 90000),
(102, 'DR SUNITA MEHTA', 'MATHEMATICS', 110000),
(103, 'DR RAJESH IYER', 'PHYSICS', 100000);

INSERT INTO teaches VALUES
(101, 'CS101', 'L1', 1, 2025),
(102, 'MATH201', 'L2', 2, 2025),
(103, 'PHYS101', 'L3', 1, 2025);

INSERT INTO takes VALUES
(001, 'CS101', 'L1', 1, 2025, 'A-'),
(002, 'MATH201', 'L2', 2, 2025, 'A'),
(003, 'PHYS101', 'L3', 1, 2025, 'B');

INSERT INTO advisor VALUES
(001, 101),
(002, 102),
(003, 103);

INSERT INTO prereq VALUES
('CS101', 'MATH201'),
('PHYS101', 'MATH201');

-- Viewing the tables


SELECT * FROM department;
SELECT * FROM student;
SELECT * FROM course;
SELECT * FROM instructor;
SELECT * FROM teaches;
SELECT * FROM takes;
SELECT * FROM advisor;
SELECT * FROM prereq;

desc department;
desc student;
desc course;
desc instructor;
desc teaches;
desc takes;
desc advisor;
desc prereq;

-- Insert with constraints

ALTER TABLE takes 
ADD CONSTRAINT check_sem 
CHECK(semester<3);

INSERT INTO takes 
VALUES (004,'CS101','L1',3,2025,'B'); 

/* THIS INSERT RECORD DOES NOT WORK BECAUSE FOREIGN KEY CONSTRAINT FAILS */

DELETE FROM department WHERE dept_name = 'Physics';

TRUNCATE TABLE advisor;

