/*
===========================================
SQL Common Table Expressions (CTE)
===========================================

Description:
A Common Table Expression (CTE) is a temporary,
named result set that exists only during the
execution of a single SQL statement.

CTEs improve query readability and make complex
queries easier to write and maintain.

Common Uses:
1. Simplifying complex queries
2. Replacing nested subqueries
3. Improving readability
4. Creating reusable result sets
5. Recursive queries

Syntax:

WITH cte_name AS (
    SELECT ...
)
SELECT *
FROM cte_name;

===========================================
*/


/*--------------------------------------------------
Basic CTE
----------------------------------------------------

Create a temporary result set and query it.

--------------------------------------------------*/

WITH employee_summary AS
(
    SELECT
        gender,
        SUM(salary) AS total_salary,
        MIN(salary) AS minimum_salary,
        MAX(salary) AS maximum_salary,
        COUNT(salary) AS employee_count,
        AVG(salary) AS average_salary
    FROM employee_demographics AS dem
    INNER JOIN employee_salary AS sal
        ON dem.employee_id = sal.employee_id
    GROUP BY gender
)

SELECT *
FROM employee_summary;


/*--------------------------------------------------
CTE Scope
----------------------------------------------------

A CTE exists only for the query immediately
following the WITH clause.

The following query will result in an error
because the CTE no longer exists.

--------------------------------------------------*/

SELECT *
FROM employee_summary;


/*--------------------------------------------------
Using a CTE for Further Calculations
--------------------------------------------------*/

WITH employee_summary AS
(
    SELECT
        gender,
        SUM(salary) AS total_salary,
        COUNT(salary) AS employee_count
    FROM employee_demographics AS dem
    INNER JOIN employee_salary AS sal
        ON dem.employee_id = sal.employee_id
    GROUP BY gender
)

SELECT
    gender,
    ROUND(total_salary / employee_count, 2) AS average_salary
FROM employee_summary;


/*--------------------------------------------------
Multiple CTEs
----------------------------------------------------

Multiple CTEs can be declared within a single
WITH clause by separating them with commas.

--------------------------------------------------*/

WITH employee_details AS
(
    SELECT
        employee_id,
        gender,
        birth_date
    FROM employee_demographics
    WHERE birth_date > '1985-01-01'
),

employee_salary_details AS
(
    SELECT
        employee_id,
        salary
    FROM employee_salary
    WHERE salary >= 50000
)

SELECT *
FROM employee_details AS ed
LEFT JOIN employee_salary_details AS es
    ON ed.employee_id = es.employee_id;


/*--------------------------------------------------
Naming Columns in a CTE
----------------------------------------------------

Column names can be specified immediately after
the CTE name.

This improves readability and avoids generated
column names.

--------------------------------------------------*/

WITH employee_summary
(
    gender,
    total_salary,
    minimum_salary,
    maximum_salary,
    employee_count
)
AS
( 
    SELECT
        gender,
        SUM(salary),
        MIN(salary),
        MAX(salary),
        COUNT(salary)
    FROM employee_demographics AS dem
    INNER JOIN employee_salary AS sal
        ON dem.employee_id = sal.employee_id
    GROUP BY gender
)

SELECT 
    gender,
    ROUND(total_salary / employee_count, 2) AS average_salary
FROM employee_summary;
