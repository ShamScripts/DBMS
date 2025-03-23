USE 20230009db;

-- Q1: Create Tables
CREATE TABLE SUPPLIER 
(SNO INTEGER, 
 SNAME VARCHAR(20), 
 CITY VARCHAR(20));

CREATE TABLE PART 
(PNO INTEGER, 
 PNAME VARCHAR(20), 
 PRICE DECIMAL(4,2));

CREATE TABLE SELLS 
(SNO INTEGER, 
 PNO INTEGER);

-- Q2: Insert Records
INSERT INTO SUPPLIER (SNO, SNAME, CITY) VALUES
(1, 'Smith', 'London'),
(2, 'Jones', 'Paris'),
(3, 'Adams', 'Vienna'),
(4, 'Blake', 'Rome');

INSERT INTO PART (PNO, PNAME, PRICE) VALUES
(1, 'Screw', 10),
(2, 'Nut', 8),
(3, 'Bolt', 15),
(4, 'Cam', 25);

INSERT INTO SELLS (SNO, PNO) VALUES
(1, 1),
(1, 2),
(2, 4),
(3, 1),
(3, 3),
(4, 2),
(4, 3),
(4, 4);

-- Q3: Update Price of 'Screw'
UPDATE PART 
SET PRICE = 15 
WHERE PNAME = 'Screw';

-- Q4: Simple Select - Retrieve all parts with PRICE > 10
SELECT * FROM PART WHERE PRICE > 10;

-- Q5: Join Using WHERE Clause - Get supplier and part names for all sales
SELECT S.SNAME, P.PNAME 
FROM SUPPLIER S, PART P, SELLS SE 
WHERE S.SNO = SE.SNO AND P.PNO = SE.PNO;

-- Q6: Aggregate Functions
-- Find the average price of all parts
SELECT AVG(PRICE) AS AVG_PRICE FROM PART;

-- Count number of parts
SELECT COUNT(PNO) AS PART_COUNT FROM PART;

-- Count number of parts sold by each supplier
SELECT S.SNO, S.SNAME, COUNT(SE.PNO) AS PARTS_SOLD
FROM SUPPLIER S, SELLS SE
WHERE S.SNO = SE.SNO
GROUP BY S.SNO, S.SNAME;

-- Find suppliers selling more than one part
SELECT S.SNO, S.SNAME, COUNT(SE.PNO) AS PARTS_SOLD
FROM SUPPLIER S, SELLS SE
WHERE S.SNO = SE.SNO
GROUP BY S.SNO, S.SNAME
HAVING COUNT(SE.PNO) > 1;

-- Q7: Sub-Queries
-- Find parts with a price greater than 'Screw'
SELECT * FROM PART 
WHERE PRICE > (SELECT PRICE FROM PART WHERE PNAME = 'Screw');

-- Find suppliers who do not sell any part
SELECT * FROM SUPPLIER S
WHERE NOT EXISTS (SELECT * FROM SELLS SE WHERE SE.SNO = S.SNO);

-- Find the highest average part price among all suppliers
SELECT MAX(subquery.avg_price)
FROM (SELECT AVG(P.PRICE) AS avg_price
      FROM SUPPLIER S, PART P, SELLS SE
      WHERE S.SNO = SE.SNO AND P.PNO = SE.PNO
      GROUP BY S.SNO) subquery;

-- Q8: Set Operations
-- UNION: Suppliers named 'Jones' or 'Adams'
SELECT SNO, SNAME, CITY FROM SUPPLIER WHERE SNAME = 'Jones'
UNION
SELECT SNO, SNAME, CITY FROM SUPPLIER WHERE SNAME = 'Adams';

-- INTERSECT: Suppliers with SNO > 1 and SNO < 3
/*SELECT SNO, SNAME, CITY FROM SUPPLIER WHERE SNO > 1
INTERSECT
SELECT SNO, SNAME, CITY FROM SUPPLIER WHERE SNO < 3; */

SELECT SNO, SNAME, CITY FROM SUPPLIER WHERE SNO > 1 
AND SNO IN (SELECT SNO FROM SUPPLIER WHERE SNO < 3);

-- EXCEPT: Suppliers with SNO > 1 but not SNO > 3
/*SELECT SNO, SNAME, CITY FROM SUPPLIER WHERE SNO > 1
EXCEPT
SELECT SNO, SNAME, CITY FROM SUPPLIER WHERE SNO > 3;*/

SELECT SNO, SNAME, CITY FROM SUPPLIER WHERE SNO > 1 
AND SNO NOT IN (SELECT SNO FROM SUPPLIER WHERE SNO > 3);


-- Q9: Create Index
CREATE INDEX I ON SUPPLIER (SNAME);

-- Create View
CREATE VIEW London_Suppliers AS 
SELECT S.SNAME, P.PNAME 
FROM SUPPLIER S, PART P, SELLS SE
WHERE S.SNO = SE.SNO AND P.PNO = SE.PNO AND S.CITY = 'London';

-- Select from the View
SELECT * FROM London_Suppliers WHERE PNAME = 'Screw';

-- Q10: Delete Tuple
DELETE FROM SUPPLIER WHERE SNAME = 'Smith';

-- Q11: Drop Table, Index, and View
DROP TABLE SUPPLIER;
DROP INDEX I ON SUPPLIER;
DROP VIEW London_Suppliers;
