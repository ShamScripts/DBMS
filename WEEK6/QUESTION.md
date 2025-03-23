#LAB 6

## TABLES

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


## Queries

1.	Write a SQL statement to know which salesman are working for which customer.

2.	Write a SQL statement to find the list of customers who appointed a salesman for their jobs who gets a commission from the company is more than 12%. 

3.	Write a SQL statement to find the list of customers who appointed a salesman for their jobs who does not live in the same city where their customer lives, and gets a commission is above 12%. 

4.	Write a SQL statement to make a join on the tables salesman, customer and orders in such a form that the same column of each table will appear once and only the relational rows will come. 

5.	Write a SQL statement to make a list in ascending order for the customer who works either through a salesman or by own. 

6.	Write a SQL statement to make a cartesian product between salesman and customer i.e. each salesman will appear for all customer and vice versa.        

7.	Write a SQL statement for the following: create a view for all salespersons. Return salesperson ID, name, and city.  

8.	Write a SQL statement to create a view for those salespeople who belong to the city of New York.

9.	Write a SQL statement for the following: create a view that counts the number of customers in each grade.

10.	Write a SQL statement for the following: create a view to <count the number of unique customers>, compute the <average purchase amount> and the <total purchase amount> of customer orders by each date (date wise in ascending order).
   
##### Importing csv data and creating a new table

Create course, prereq tables using MYSQL WORKBENCH’s Data IMPORT Feature (you can create CSV file using EXCEL/WORD/WORDPAD and Import this csv data into a table (relation))

Relation course

 ![image](https://github.com/user-attachments/assets/09491d2a-b3f2-4353-b147-496cecc7c65b)

Relation prereq

 ![image](https://github.com/user-attachments/assets/3de7259c-37b1-4643-aef2-b2f8a5b8ab91)

11.	Write SQL Query to Perform **left outer join** to get the following output.
![image](https://github.com/user-attachments/assets/2e4c89b3-2154-4795-9a7d-276b534b2c93)

12.	Write SQL Query to Perform **right outer join** to get the following output.
 ![image](https://github.com/user-attachments/assets/86584f8b-a2df-45ba-866c-62aca1202bb5)

13.	Write SQL query to Perform **full outer join** to get the following output. 
 (NOTE: Since Full Join is not supported in MySQL, union is used). 
![image](https://github.com/user-attachments/assets/3639105d-bd78-4c13-987d-ea491680eb43)

