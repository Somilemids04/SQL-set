/*
===========================================
SQL JOINS 
===========================================

Description:
A JOIN combines data from two or more tables based on a
related column between them.

Common JOIN Types:
1. INNER JOIN
2. LEFT JOIN
3. RIGHT JOIN
4. SELF JOIN
5. Joining Multiple Tables

Prerequisite:
The tables should have a common column (or related values)
that can be used to establish the relationship.

===========================================
*/


/*--------------------------------------------------
View Sample Tables
--------------------------------------------------*/

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;
 

/*--------------------------------------------------
INNER JOIN
----------------------------------------------------

Returns only the rows that have matching values
in both tables.

--------------------------------------------------*/

SELECT *
FROM employee_demographics
INNER JOIN employee_salary
    ON employee_demographics.employee_id = employee_salary.employee_id;


/*--------------------------------------------------
Using Table Aliases
----------------------------------------------------

Aliases make queries shorter and easier to read,
especially when working with multiple tables.

--------------------------------------------------*/

SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
    ON dem.employee_id = sal.employee_id;


/*--------------------------------------------------
LEFT JOIN
----------------------------------------------------

Returns:
- All rows from the left table
- Matching rows from the right table
- NULL values when no match exists

--------------------------------------------------*/

SELECT *
FROM employee_salary AS sal
LEFT JOIN employee_demographics AS dem 
    ON sal.employee_id = dem.employee_id;


/*--------------------------------------------------
RIGHT JOIN
----------------------------------------------------

Returns:
- All rows from the right table
- Matching rows from the left table
- NULL values when no match exists

--------------------------------------------------*/

SELECT *
FROM employee_salary AS sal
RIGHT JOIN employee_demographics AS dem
    ON sal.employee_id = dem.employee_id;


/*--------------------------------------------------
SELF JOIN
----------------------------------------------------

A SELF JOIN joins a table with itself.

Useful for:
- Employee/Manager relationships
- Hierarchical data
- Sequential record comparisons

--------------------------------------------------*/


-- Join the table with itself
SELECT *
FROM employee_salary AS emp1
INNER JOIN employee_salary AS emp2
    ON emp1.employee_id = emp2.employee_id;


-- Example: Pair each employee with the next employee ID
SELECT *
FROM employee_salary AS emp1
INNER JOIN employee_salary AS emp2
    ON emp1.employee_id + 1 = emp2.employee_id;


-- Display selected columns with aliases
SELECT
    emp1.employee_id AS employee_id,
    emp1.first_name AS employee_first_name,
    emp1.last_name AS employee_last_name,
    emp2.employee_id AS paired_employee_id,
    emp2.first_name AS paired_first_name,
    emp2.last_name AS paired_last_name
FROM employee_salary AS emp1
INNER JOIN employee_salary AS emp2
    ON emp1.employee_id + 1 = emp2.employee_id;


/*--------------------------------------------------
Joining Multiple Tables
----------------------------------------------------

Multiple JOINs can be used to retrieve related
data from several tables in a single query.

--------------------------------------------------*/


-- View departments table
SELECT *
FROM parks_departments;


-- INNER JOIN across three tables
SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
    ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments AS dept
    ON sal.dept_id = dept.department_id;


-- LEFT JOIN to include employees
-- without an assigned department
SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
    ON dem.employee_id = sal.employee_id
LEFT JOIN parks_departments AS dept
    ON sal.dept_id = dept.department_id;
