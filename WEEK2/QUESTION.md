## Database Schema and Operations

### Consider the following database schema and perform the following operations:

1. **Create a table** for the following:
   - `department(dept_name, building, budget)`

2. **Alter the above table** to add a primary key.

3. **Create the following tables** with primary key and foreign key constraints:
   - `Student(SID, name, dept_name, total_credit)`
     - **Foreign Key:** `dept_name` references `department(dept_name)`
   
   - `course(course_id, title, dept_name , credits)`
     - **Foreign Key:** `dept_name` references `department(dept_name)`
   
   - `instructor(IID, name, dept_name, salary)`
     - **Foreign Key:** `dept_name` references `department(dept_name)`
   
   - `teaches(IID, course_id, sec_id, semester, year)`
     - **Foreign Keys:** `course_id` references `course(course_id)`, `IID` references `instructor(IID)`
   
   - `takes(SID, course_id, sec_id, semester, year, grade)`
     - **Foreign Keys:** `SID` references `student(SID)`, `course_id` references `course(course_id)`
   
   - `advisor(SID, IID)`
     - **Foreign Keys:** `IID` references `instructor(IID)`, `SID` references `student(SID)`
   
   - `prereq(course_id, prereq_id)`
     - **Foreign Keys:** `course_id` references `course(course_id)`, `prereq_id` references `course(course_id)`

4. **Alter the `Instructor` table** to set `100000` as the default salary.

5. **Insert some rows** into all of the above tables.

6. **Insert a row into `takes` table** with the semester value as 3 or above and view the effect of constraints.

7. **Delete some rows** to view the effect of foreign key constraints.

8. **TRUNCATE and DROP tables.**

