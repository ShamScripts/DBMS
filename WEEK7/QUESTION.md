
# DBS LAB #07

## 3NF & 4NF Design

---
#### Sample Table:

The table below shows an extract from a tour operator's data on travel agent bookings. Derive the third normal form of the data.


| batchno | agentno | agent name     | holiday code | cost | quantity booked | airport code | airport name |
|---------|---------|----------------|--------------|------|------------------|---------------|---------------|
| 1       | 76      | Bairns travel  | B563         | 363  | 10              | 1             | Luton         |
|         |         |                | B248         | 248  | 20              | 12            | Edinburgh     |
|         |         |                | B428         | 322  | 18              | 11            | Glasgow       |
| 2       | 142     | Active Holidays| B563         | 363  | 15              | 1             | Luton         |
|         |         |                | C930         | 568  | 2               | 14            | Newcastle     |
|         |         |                | A270         | 972  | 1               | 14            | Newcastle     |
|         |         |                | B728         | 248  | 5               | 12            | Edinburgh     |
| 3       | 76      | Bairns travel  | C930         | 568  | 11              | 1             | Luton         |
|         |         |                | A430         | 279  | 15              | 11            | Glasgow       |

### QUESTION 1 - 3NF

#### Check if the below answer is in 3NF. Justify your answer:

- R1(holidaycode, cost)
- R2(airportcode, airportname)
- R3(agentcode, agentname)
- R4(batchno, agentno, holidaycode, airportcode, quantitybooked)

#### SQL Queries:

1. Create and Populate the 3NF tables.
2. Create a view: For each agent display `<agentname, holidaycode, cost, quantitybooked, airportname, batchno, totalcost>`.

> Note: `totalcost = cost * quantitybooked`

### QUESTION 2 - 4NF

Given the relation:

```
CSB(CourseID, StudentID, RefBook)
```

With Multivalued Dependencies (MVDs):

- CourseID −>> StudentID
- CourseID −>> RefBook

#### Check if the below decomposition is correct. Justify your answer:

- COURSESTUDENT (CourseID, StudentID) — Primary key: (CourseID, StudentID)
- COURSEBOOK (CourseID, RefBook) — Primary key: (CourseID, RefBook)

#### SQL Queries:

1. Create and populate the 4NF tables (enter at least 6 records).
2. Create views for the following:
   a) Display the StudentIDs for all CourseIDs (list of students in all courses).
   b) Display the list of RefBooks for all CourseIDs (list of reference books for all courses).
