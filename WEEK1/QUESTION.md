## Week I

### Familiarization with Simple SQL Commands

#### Tasks:

**Create the `Admission` Table** with the following fields and answer the following queries:
   - `No`
   - `Name`
   - `Age`
   - `Department`
   - `DateofAdm`
   - `Fee`
   - `Sex`

   Sample Data:
   
   | No | Name   | Age | Department | DateofAdm  | Fee | Sex |
   |----|--------|-----|------------|------------|-----|----|
   | 1  | Pankaj  | 24  | Computer   | 2002-10-12 | 120 | M  |
   | 2  | Shalini | 21  | History    | 2012-02-25 | 200 | F  |
   | 3  | Sanjay  | 22  | HINDI      | 2010-10-10 | 300 | F  |
   | 4  | Sudha   | 25  | History    | 2015-05-30 | 400 | F  |
   | 5  | Rakesh  | 22  | Hindi      | 2012-12-12 | 250 | M  |
   | 6  | Shakeel | 30  | History    | 2016-01-03 | 300 | M  |
   | 7  | Surya   | 34  | Computer   | 2013-03-30 | 210 | M  |

**Perform the following operations:**
   - Change the age of Pankaj to 27.
   - Change the fee paid by Sudha to 425.
   - Add a column `city` of type `VARCHAR(30)`.
   - Delete the column `city`.

---

### Pet Table Queries

**Create the following `pet` table** with the following schema and answer the following queries:
   ```sql
   CREATE TABLE pet (
       name VARCHAR(20),
       owner VARCHAR(20),
       species VARCHAR(20),
       sex CHAR(1),
       birth DATE,
       death DATE
   );
   ```

   Sample Data:
   
   | Name   | Owner  | Species | Sex | Birth      | Death      |
   |--------|--------|---------|-----|------------|------------|
   | Fluffy | Harold | Cat     | F   | 1993-02-04 | NULL       |
   | Claws  | Gwen   | Cat     | M   | 1994-03-17 | NULL       |
   | Buffy  | Harold | Dog     | F   | 1989-05-13 | NULL       |
   | Fang   | Benny  | Dog     | M   | 1990-08-27 | NULL       |
   | Bowser | Diane  | Dog     | M   | 1979-08-31 | 1995-07-29 |
   | Chirpy | Gwen   | Bird    | F   | 1998-09-11 | NULL       |
   | Whistler | Gwen | Bird    | NULL | 1997-12-09 | NULL       |
   | Slim   | Benny  | Snake   | M   | 1996-04-29 | NULL       |
   | Puffball | Diane | Hamster | F   | 1999-03-30 | NULL       |

**Answer the following queries:**
   - Display all details of pet `Fang`.
   - Display all details of pets owned by `Gwen`.
   - Display the owner names of all `dogs`.
   - Display details of all `female` pets.
   - Display the `DOB` of the hamster.
