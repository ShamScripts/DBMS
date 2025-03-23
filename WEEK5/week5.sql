USE 20230009db;

-- Viewing all the tables
SELECT * FROM mockdata;
SELECT * FROM SALESMAN;
SELECT * FROM CUSTOMER;
SELECT * FROM ORDERS;

-- 1. Salesmen living in a city where any customer lives
SELECT * 
FROM SALESMAN 
WHERE city IN (SELECT DISTINCT city FROM CUSTOMER);

-- 2. Orders with an amount greater than at least one order on Sept 10, 2012
SELECT * 
FROM ORDERS 
WHERE purch_amt > ANY 
(
    SELECT purch_amt 
    FROM ORDERS 
    WHERE ord_date = '2012-09-10'
);

-- 3. Orders smaller than any amount for a customer in London
SELECT * 
FROM ORDERS 
WHERE purch_amt < ANY 
(
    SELECT purch_amt 
    FROM ORDERS 
    WHERE customer_id IN 
    (
        SELECT customer_id FROM CUSTOMER WHERE city = 'London'
    )
);

-- 4. Customers with grade higher than every customer in New York
SELECT * 
FROM CUSTOMER 
WHERE grade > ALL 
(
    SELECT grade 
    FROM CUSTOMER 
    WHERE city = 'New York'
);

-- 5. Customers whose grade is different from any customer in London
SELECT * 
FROM CUSTOMER 
WHERE grade NOT IN 
(
    SELECT DISTINCT grade 
    FROM CUSTOMER 
    WHERE city = 'London'
);

-- 6. Orders issued by salesman 'Paul Adam'
SELECT * 
FROM ORDERS 
WHERE salesman_id = 
(
    SELECT salesman_id 
    FROM SALESMAN 
    WHERE name = 'Paul Adam'
);

-- 7. Orders for salesmen from London
SELECT * 
FROM ORDERS 
WHERE salesman_id IN 
(
    SELECT salesman_id 
    FROM SALESMAN 
    WHERE city = 'London'
);

-- 8. Orders greater than the average order value for Oct 10, 2012
SELECT * 
FROM ORDERS 
WHERE purch_amt > 
(
    SELECT AVG(purch_amt) 
    FROM ORDERS 
    WHERE ord_date = '2012-10-10'
);

-- 9. Commission of salesmen servicing customers in Paris
SELECT DISTINCT S.salesman_id, S.name, S.commission 
FROM SALESMAN S
JOIN CUSTOMER C ON S.salesman_id = C.salesman_id
WHERE C.city = 'Paris';

-- 10. Customers who placed orders on Oct 5, 2012
SELECT DISTINCT C.*
FROM CUSTOMER C
JOIN ORDERS O ON C.customer_id = O.customer_id
WHERE O.ord_date = '2012-10-05';
