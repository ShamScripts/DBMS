-- ##############################################################
--  4NF DECOMPOSITION JUSTIFICATION
-- ##############################################################

-- Original Relation:
-- CSB(CourseID, StudentID, RefBook)

-- Given Multivalued Dependencies (MVDs):
--   - CourseID →→ StudentID
--   - CourseID →→ RefBook

-- The student and the reference book are independent entities,
-- both associated with the CourseID but not directly with each other.

-- Proposed Decomposition:
--   1. COURSESTUDENT(CourseID, StudentID)     -- PK: (CourseID, StudentID)
--   2. COURSEBOOK(CourseID, RefBook)          -- PK: (CourseID, RefBook)

-- Justification:
-- This decomposition is correct because:
-- - The original relation violates 4NF due to multiple independent MVDs.
-- - After decomposition, each relation contains only one MVD,
--   and all non-trivial MVDs involve a candidate key.
-- - This avoids unnecessary redundancy (Cartesian product of StudentIDs and RefBooks).

-- inal Verdict:
-- Both COURSESTUDENT and COURSEBOOK are in 4NF.


-- QUESTION ii [4NF]

-- 1. Creating and Populating the 4NF Tables

-- COURSESTUDENT Table
CREATE TABLE COURSESTUDENT (
    CourseID VARCHAR(10),
    StudentID VARCHAR(10),
    PRIMARY KEY (CourseID, StudentID)
);

INSERT INTO COURSESTUDENT VALUES
('CSE101', 'S1'),
('CSE101', 'S2'),
('CSE102', 'S1'),
('CSE102', 'S3'),
('CSE103', 'S4'),
('CSE103', 'S5');

-- COURSEBOOK Table
CREATE TABLE COURSEBOOK (
    CourseID VARCHAR(10),
    RefBook VARCHAR(100),
    PRIMARY KEY (CourseID, RefBook)
);

INSERT INTO COURSEBOOK VALUES
('CSE101', 'Database Systems'),
('CSE101', 'Data Modeling'),
('CSE102', 'Operating Systems'),
('CSE102', 'Computer Architecture'),
('CSE103', 'Networking Fundamentals'),
('CSE103', 'Wireless Networks');

-- 2. Creating View

-- a. View: List of students in all courses
CREATE VIEW StudentsInCourses AS
SELECT CourseID, StudentID
FROM COURSESTUDENT;

-- b. View: List of reference books for all courses
CREATE VIEW RefBooksInCourses AS
SELECT CourseID, RefBook
FROM COURSEBOOK;

