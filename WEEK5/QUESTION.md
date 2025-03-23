# LAB 5

---

#### TABLE: SALESMAN

| salesman_id | name         | city        | commission |
|------------|------------|------------|------------|
| 5001       | James Hoog  | New York   | 0.15       |
| 5002       | Nail Knite  | Paris      | 0.13       |
| 5005       | Pit Alex    | London     | 0.11       |
| 5006       | Mc Lyon     | Paris      | 0.14       |
| 5003       | Lauson Hen  |            | 0.12       |
| 5007       | Paul Adam   | Rome       | 0.13       |

#### TABLE: CUSTOMER

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

#### TABLE: ORDERS

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

### Queries

1. Write a query to find salesmen with all information who lives in the city where any of the customers lives.
2. Write a query to display all the orders that had amounts that were greater than at least one of the orders on September 10th 2012.
3. Write a query to display all orders with an amount smaller than any amount for a customer in London.
4. Write a query to display only those customers whose grade are, in fact, higher than every customer in New York.
5. Write a query to get all the information for those customers whose grade is not as the grade of customer who belongs to the city London.
6. Write a query to display all the orders from the orders table issued by the salesman 'Paul Adam'.
7. Write a query to display all the orders for the salesman who belongs to the city London.
8. Write a query to display all the orders which values are greater than the average order value for 10th October 2012.
9. Write a query to display the commission of all the salesmen servicing customers in Paris.
10. Write a query to display all customers with orders on October 5, 2012.
