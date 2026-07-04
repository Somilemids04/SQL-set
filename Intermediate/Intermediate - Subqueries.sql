/*
===========================================
SQL Subqueries
===========================================

Description:
A subquery (also called an inner query or nested query)
is a query embedded inside another SQL query.

Subqueries can be used in:
1. WHERE clause
2. SELECT clause
3. FROM clause

Common Uses:
- Filtering records
- Performing comparisons
- Creating temporary result sets
- Simplifying complex queries

===========================================
*/


/*--------------------------------------------------
Subquery in the WHERE Clause
----------------------------------------------------

A subquery can be used to filter records based on
the results returned by another query.

--------------------------------------------------*/

SELECT *
FROM employee_demographics
WHERE employee_id IN (
    SELECT employee_id
    FROM employee_salary
    WHERE dept_id = 1
);


/*--------------------------------------------------
Invalid Example
----------------------------------------------------

A subquery used with the IN operator must return
only one column.

--------------------------------------------------*/

SELECT *
FROM employee_demographics
WHERE employee_id IN (
    SELECT employee_id,
           salary
    FROM employee_salary
    WHERE dept_id = 1
);


/*--------------------------------------------------
Subquery in the SELECT Clause
----------------------------------------------------

Display each employee's salary along with the
overall average salary.

--------------------------------------------------*/

SELECT
    first_name,
    salary,
    (
        SELECT AVG(salary)
        FROM employee_salary
    ) AS average_salary
FROM employee_salary;


/*--------------------------------------------------
Subquery in the FROM Clause
----------------------------------------------------

A subquery in the FROM clause creates a temporary
result set that can be queried like a table.

Every derived table must have an alias.

--------------------------------------------------*/

SELECT *
FROM (
    SELECT
        gender,
        MIN(age) AS minimum_age,
        MAX(age) AS maximum_age,
        COUNT(age) AS employee_count,
        AVG(age) AS average_age
    FROM employee_demographics
    GROUP BY gender
) AS age_summary;


/*--------------------------------------------------
Querying a Derived Table
----------------------------------------------------

The derived table can be treated like any
other table in a SQL query.

--------------------------------------------------*/

SELECT
    gender,
    AVG(minimum_age) AS average_minimum_age
FROM (
    SELECT
        gender,
        MIN(age) AS minimum_age,
        MAX(age) AS maximum_age,
        COUNT(age) AS employee_count,
        AVG(age) AS average_age
    FROM employee_demographics
    GROUP BY gender
) AS age_summary
GROUP BY gender;