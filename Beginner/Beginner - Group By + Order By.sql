/*
===========================================
SQL GROUP BY & ORDER BY Clauses
=========================================== 

Description:
The GROUP BY clause groups rows that have identical values in one or
more columns, allowing aggregate functions to be applied to each group.

The ORDER BY clause sorts query results in ascending (ASC) or
descending (DESC) order.

Topics Covered:
1. GROUP BY
2. Grouping multiple columns
3. Aggregate functions
4. ORDER BY
5. Sorting multiple columns 
6. Sorting using column positions
===========================================
*/


/*--------------------------------------------------
GROUP BY Clause
----------------------------------------------------

The GROUP BY clause groups rows that share the same
values in one or more columns.

It is commonly used with aggregate functions such as:
- COUNT()
- SUM()
- AVG()
- MIN()
- MAX()

--------------------------------------------------*/


-- Display all employee demographic records
SELECT *
FROM employee_demographics;


-- Group employees by gender
SELECT gender
FROM employee_demographics
GROUP BY gender;


-- Invalid Example
-- Every selected column should either be:
-- 1. Included in the GROUP BY clause, or
-- 2. Used with an aggregate function.
-- (Behavior may vary depending on SQL mode.)

SELECT first_name
FROM employee_demographics
GROUP BY gender;


-- Group employees by occupation
SELECT occupation
FROM employee_salary
GROUP BY occupation;


-- Group by multiple columns
SELECT
    occupation,
    salary
FROM employee_salary
GROUP BY
    occupation,
    salary;


-- Calculate average age for each gender
SELECT
    gender,
    AVG(age) AS average_age
FROM employee_demographics
GROUP BY gender;


-- Multiple aggregate functions
SELECT
    gender,
    MIN(age) AS minimum_age,
    MAX(age) AS maximum_age,
    COUNT(age) AS total_employees,
    AVG(age) AS average_age
FROM employee_demographics
GROUP BY gender;


/*--------------------------------------------------
ORDER BY Clause
----------------------------------------------------

The ORDER BY clause sorts query results.

Default:
ASC (Ascending)

Optional:
DESC (Descending)

--------------------------------------------------*/


-- Display all employee records
SELECT *
FROM employee_demographics;


-- Sort employees by first name (Ascending)
SELECT *
FROM employee_demographics
ORDER BY first_name;


-- Sort employees by first name (Descending)
SELECT *
FROM employee_demographics
ORDER BY first_name DESC;


-- Sort by multiple columns
SELECT *
FROM employee_demographics
ORDER BY
    gender,
    age;


-- Sort multiple columns in descending order
SELECT *
FROM employee_demographics
ORDER BY
    gender DESC,
    age DESC;
    
/*--------------------------------------------------
Ordering by Column Position
----------------------------------------------------

Instead of column names, you can use the column's
position in the SELECT statement.

Example:
ORDER BY 5 DESC, 4 DESC

Although supported, using column names is considered
best practice because queries remain easier to read
and are less likely to break if the table structure
changes.

--------------------------------------------------*/

SELECT *
FROM employee_demographics
ORDER BY
    5 DESC,
    4 DESC;
