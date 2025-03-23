USE 20230009db;

SELECT * FROM SALESMAN;
SELECT * FROM CUSTOMER;
SELECT * FROM ORDERS;

-- 1. Find which salesman is working for which customer  
SELECT S.salesman_id, S.name AS salesman_name, C.customer_id, C.cust_name AS customer_name
FROM SALESMAN S
INNER JOIN CUSTOMER C ON S.salesman_id = C.salesman_id;

-- 2. Find customers whose salesman gets a commission greater than 12%  
SELECT C.customer_id, C.cust_name, S.salesman_id, S.name AS salesman_name, S.commission
FROM CUSTOMER C
INNER JOIN SALESMAN S ON C.salesman_id = S.salesman_id
WHERE S.commission > 0.12;

-- 3. Find customers whose salesman does not live in the same city and has a commission above 12%  
SELECT C.customer_id, C.cust_name, C.city AS customer_city, S.salesman_id, S.name AS salesman_name, 
       S.city AS salesman_city, S.commission
FROM CUSTOMER C
INNER JOIN SALESMAN S ON C.salesman_id = S.salesman_id
WHERE S.city <> C.city AND S.commission > 0.12;

-- 4. Join SALESMAN, CUSTOMER, and ORDERS ensuring each column appears only once and rows are relational  
SELECT O.ord_no, O.purch_amt, O.ord_date, C.customer_id, C.cust_name, C.city AS customer_city, 
       S.salesman_id, S.name AS salesman_name, S.city AS salesman_city, S.commission
FROM ORDERS O
NATURAL JOIN CUSTOMER C
NATURAL JOIN SALESMAN S;

-- 5. List customers who work either through a salesman or by themselves (in ascending order)  
SELECT C.customer_id, C.cust_name, C.city, C.grade, S.salesman_id, S.name AS salesman_name
FROM CUSTOMER C
LEFT JOIN SALESMAN S ON C.salesman_id = S.salesman_id
ORDER BY C.cust_name ASC;

-- 6. Cartesian product between SALESMAN and CUSTOMER (each SALESMAN for all CUSTOMERS and vice versa)  
SELECT S.salesman_id, S.name AS salesman_name, C.customer_id, C.cust_name
FROM SALESMAN S
CROSS JOIN CUSTOMER C;

-- 7. Create a view for all SALESMAN with their ID, name, and city  
CREATE VIEW Salesperson_View AS
SELECT salesman_id, name, city
FROM SALESMAN;

SELECT * FROM Salesperson_View;

-- 8. Create a view for SALESMAN from New York  
CREATE VIEW NewYork_Salesperson AS
SELECT salesman_id, name, city, commission
FROM SALESMAN
WHERE city = 'New York';

SELECT * FROM NewYork_Salesperson;


