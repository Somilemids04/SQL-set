/*
===========================================
SQL LIMIT & ALIAS Clauses
===========================================

Description:
The LIMIT clause restricts the number of rows returned by a query.

Aliases provide temporary names for columns or expressions,
making query results easier to read and understand.

Topics Covered:
1. LIMIT
2. LIMIT with ORDER BY
3. LIMIT with Offset
4. Column Aliases
5. Using the AS keyword
===========================================
*/


/*--------------------------------------------------
LIMIT Clause
----------------------------------------------------

The LIMIT clause restricts the number of rows
returned by a query.

Syntax:
LIMIT number_of_rows

--------------------------------------------------*/


-- Display the first 3 records
SELECT *
FROM employee_demographics
LIMIT 3;


-- Display the first 3 employees sorted alphabetically
SELECT *
FROM employee_demographics
ORDER BY first_name
LIMIT 3;


/*--------------------------------------------------
LIMIT with Offset
----------------------------------------------------

Syntax:
LIMIT offset, row_count

offset    -> Starting position (zero-based)
row_count -> Number of rows to return

--------------------------------------------------*/


-- Display all employees sorted by first name
SELECT *
FROM employee_demographics
ORDER BY first_name;


-- Skip the first 3 rows and return the next 2 rows
SELECT *
FROM employee_demographics
ORDER BY first_name
LIMIT 3, 2;


/*--------------------------------------------------
Example: Find the Third Oldest Employee
--------------------------------------------------*/

-- View employees ordered by age (oldest to youngest)
SELECT *
FROM employee_demographics
ORDER BY age DESC;


-- Skip the first two oldest employees
-- Return the third oldest employee
SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 2, 1;


/*--------------------------------------------------
Column Aliases
----------------------------------------------------

Aliases provide temporary names for columns,
expressions, or tables.

Benefits:
- Improves readability
- Simplifies complex query outputs
- Useful when working with aggregate functions

--------------------------------------------------*/


-- Average age grouped by gender
SELECT
    gender,
    AVG(age)
FROM employee_demographics
GROUP BY gender;


-- Using the AS keyword
SELECT
    gender,
    AVG(age) AS average_age
FROM employee_demographics
GROUP BY gender;


-- AS keyword is optional
SELECT
    gender,
    AVG(age) average_age
FROM employee_demographics
GROUP BY gender;