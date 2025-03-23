# CSF212 DATABASE SYSTEMS
## LAB#03  Feb 24-Feb 28, 2025

### Create the three tables (with appropriate datatype) given below and answer the following queries

```sql
SHOW TABLES;
DESC student;
```

### TABLE: SALESMAN

| salesman_id | name         | city        | commission |
|------------|------------|------------|------------|
| 5001       | James Hoog  | New York   | 0.15       |
| 5002       | Nail Knite  | Paris      | 0.13       |
| 5005       | Pit Alex    | London     | 0.11       |
| 5006       | Mc Lyon     | Paris      | 0.14       |
| 5003       | Lauson Hen  |            | 0.12       |
| 5007       | Paul Adam   | Rome       | 0.13       |

### TABLE: CUSTOMER

| customer_id | cust_name     | city        | grade | salesman_id |
|------------|--------------|------------|-------|------------|
| 3002       | Nick Rimando | New York   | 100   | 5001       |
| 3005       | Graham Zusi  | California | 200   | 5002       |
| 3001       | Brad Guzan   | London     |       | 5005       |
| 3004       | Fabian Johns | Paris      | 300   | 5006       |
| 3007       | Brad Davis   | New York   | 200   | 5001       |
| 3009       | Geoff Camero | Berlin     | 100   | 5003       |
| 3008       | Julian Green | London     | 300   | 5002       |
| 3003       | Jozy Altidor | Moscow     | 200   | 5007       |

### TABLE: ORDERS

| ord_no  | purch_amt | ord_date   | customer_id | salesman_id |
|--------|-----------|-----------|------------|------------|
| 70001  | 150.5     | 2012-10-05 | 3005       | 5002       |
| 70009  | 270.65    | 2012-09-10 | 3001       | 5005       |
| 70002  | 65.26     | 2012-10-05 | 3002       | 5001       |
| 70004  | 110.5     | 2012-08-17 | 3009       | 5003       |
| 70007  | 948.5     | 2012-09-10 | 3005       | 5002       |
| 70005  | 2400.6    | 2012-07-27 | 3007       | 5001       |
| 70008  | 5760      | 2012-09-10 | 3002       | 5001       |
| 70010  | 1983.43   | 2012-10-10 | 3004       | 5006       |
| 70003  | 2480.4    | 2012-10-10 | 3009       | 5003       |
| 70012  | 250.45    | 2012-06-27 | 3008       | 5002       |
| 70011  | 75.29     | 2012-08-17 | 3003       | 5007       |
| 70013  | 3045.6    | 2012-04-25 | 3002       | 5001       |

### Queries:

1. Write a query to find those customers with their name and those salesmen with their name and city who live in the same city.
2. Write a SQL statement to find the names of all customers along with the salesmen who work for them.
3. Write a SQL statement to display all those orders by the customers not located in the same cities where their salesmen live.
4. Write a SQL statement that finds out each order number followed by the name of the customers who made the order.
5. Write a SQL statement that sorts out the customer and their grade who made an order. Each of the customers must have a grade and be served by at least a salesman who belongs to a city.
6. Write a query that produces all customers with their name, city, salesman, and commission, who are served by a salesman and the salesman works at a rate of commission within 12% to 14%.
7. Write a SQL statement that produces all orders with the order number, customer name, commission rate, and earned commission amount for those customers who have a grade of 200 or more and are served by an existing salesman.
8. Write a query to display all customers with a grade above 100.
9. Write a query statement to display all customers in New York who have a grade value above 100.
10. Write a SQL statement to display all the customers who either belong to the city New York or do not have a grade above 100.
11. Write a SQL query to display those customers who neither belong to the city New York nor have a grade value of more than 100.
12. Write a SQL statement to display either those orders that are not issued on date 2012-09-10 and issued by the salesman whose ID is 5005 and below or those orders where the purchase amount is 1000.00 and below.
