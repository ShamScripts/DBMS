USE 20230009db;

-- Create SALESMAN table
CREATE TABLE SALESMAN (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    commission DECIMAL(4,2)
);

-- Insert data into SALESMAN table
INSERT INTO SALESMAN VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5003, 'Lauson Hen', NULL, 0.12),
(5007, 'Paul Adam', 'Rome', 0.13);
 
-- Create CUSTOMER table
CREATE TABLE CUSTOMER (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(50),
    city VARCHAR(50),
    grade INT,
    salesman_id INT,
    FOREIGN KEY (salesman_id) REFERENCES SALESMAN(salesman_id)
);

-- Insert data into CUSTOMER table
INSERT INTO CUSTOMER VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3001, 'Brad Guzan', 'London', NULL, 5005),
(3004, 'Fabian Johns', 'Paris', 300, 5006),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3009, 'Geoff Camero', 'Berlin', 100, 5003),
(3008, 'Julian Green', 'London', 300, 5002),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007);
 
-- Create ORDERS table
CREATE TABLE ORDERS (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(10,2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT,
    FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id),
    FOREIGN KEY (salesman_id) REFERENCES SALESMAN(salesman_id)
);

-- Insert data into ORDERS table
INSERT INTO ORDERS VALUES
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.4, '2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5007),
(70013, 3045.6, '2012-04-25', 3002, 5001);

-- Descring the tables
DESC SALESMAN;
DESC CUSTOMER;
DESC ORDERS; 
 
-- Viewing all the tables
SELECT * FROM SALESMAN;
SELECT * FROM CUSTOMER;
SELECT * FROM ORDERS; 
 
-- 1. Customers and salesmen in the same city  
SELECT c.cust_name, s.name, s.city  
FROM CUSTOMER c  
JOIN SALESMAN s ON c.city = s.city;  
 
-- 2. Customers and their salesmen  
SELECT c.cust_name, s.name  
FROM CUSTOMER c  
JOIN SALESMAN s ON c.salesman_id = s.salesman_id;  
 
-- 3. Orders from customers not in the same city as their salesman  
SELECT o.ord_no, c.cust_name, c.city AS customer_city, s.city AS salesman_city  
FROM ORDERS o  
JOIN CUSTOMER c ON o.customer_id = c.customer_id  
JOIN SALESMAN s ON o.salesman_id = s.salesman_id  
WHERE c.city <> s.city;  
 
-- 4. Order number and customer name  
SELECT o.ord_no, c.cust_name  
FROM ORDERS o  
JOIN CUSTOMER c ON o.customer_id = c.customer_id;  
 
-- 5. Customers with a grade who placed an order and have a salesman from a city  
SELECT DISTINCT c.cust_name, c.grade  
FROM CUSTOMER c  
JOIN ORDERS o ON c.customer_id = o.customer_id  
JOIN SALESMAN s ON c.salesman_id = s.salesman_id  
WHERE c.grade IS NOT NULL AND s.city IS NOT NULL;  
 
-- 6. Customers served by salesmen with commission 12%-14%  
SELECT c.cust_name, c.city, s.name AS salesman, s.commission  
FROM CUSTOMER c  
JOIN SALESMAN s ON c.salesman_id = s.salesman_id  
WHERE s.commission BETWEEN 0.12 AND 0.14;  
 
-- 7. Orders with commission for customers with grade ≥ 200  
SELECT o.ord_no, c.cust_name, s.commission, (o.purch_amt * s.commission) AS earned_commission  
FROM ORDERS o  
JOIN CUSTOMER c ON o.customer_id = c.customer_id  
JOIN SALESMAN s ON o.salesman_id = s.salesman_id  
WHERE c.grade >= 200;  
 
-- 8. Customers with grade above 100  
SELECT * FROM CUSTOMER WHERE grade > 100;  
 
-- 9. Customers in New York with grade above 100  
SELECT * FROM CUSTOMER WHERE city = 'New York' AND grade > 100;  
 
-- 10. Customers in New York or grade ≤ 100  
SELECT * FROM CUSTOMER WHERE city = 'New York' OR grade <= 100;  
 
-- 11. Customers not in New York and grade ≤ 100  
SELECT * FROM CUSTOMER WHERE city <> 'New York' AND (grade IS NULL OR grade <= 100);  
 
-- 12. Orders not on '2012-09-10' (salesman ≤ 5005) OR purchase ≤ 1000  
SELECT * FROM ORDERS  
WHERE (ord_date <> '2012-09-10' AND salesman_id <= 5005)  
   OR purch_amt <= 1000.00;