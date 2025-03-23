-- Create a View to Count Customers by Grade

CREATE VIEW CustomersByGrade AS
SELECT grade, COUNT(customer_id) AS number
FROM CUSTOMER
GROUP BY grade;

SELECT * FROM CustomersByGrade;

-- Create a View for Customer Orders by Date

CREATE VIEW OrdersByDate AS
SELECT ord_date, COUNT(DISTINCT customer_id) AS count,
       AVG(purch_amt) AS avg, SUM(purch_amt) AS sum
FROM ORDERS
GROUP BY ord_date
ORDER BY ord_date ASC;

SELECT * FROM OrdersByDate;

-- Left Outer Join 

SELECT C.course_id, C.course_name, P.prereq_id
FROM COURSE C
LEFT OUTER JOIN PREREQ P ON C.course_id = P.course_id;

-- Right Outer Join 

SELECT C.course_id, C.course_name, P.prereq_id
FROM COURSE C
RIGHT OUTER JOIN PREREQ P ON C.course_id = P.course_id;

-- Full Outer Join Example (Using UNION in MySQL)

SELECT C.course_id, C.course_name, P.prereq_id
FROM COURSE C
LEFT OUTER JOIN PREREQ P ON C.course_id = P.course_id

UNION

SELECT C.course_id, C.course_name, P.prereq_id
FROM COURSE C
RIGHT OUTER JOIN PREREQ P ON C.course_id = P.course_id
WHERE C.course_id IS NULL;

