/*
===========================================
SQL UNION
===========================================

Description:
The UNION operator combines the result sets of two 
or more SELECT statements by stacking rows vertically.

Rules:
1. Each SELECT statement must return the same number
   of columns.
2. Corresponding columns should have compatible
   data types.
3. The column names in the final result are taken
   from the first SELECT statement.

Types:
- UNION (removes duplicates)
- UNION ALL (keeps duplicates)

=========================================== 
*/


/*--------------------------------------------------
UNION with Different Data
----------------------------------------------------

Although possible, combining unrelated columns
is generally not recommended.

--------------------------------------------------*/

SELECT
    first_name,
    last_name
FROM employee_demographics

UNION

SELECT
    occupation,
    salary
FROM employee_salary;


/*--------------------------------------------------
UNION with Matching Columns 
----------------------------------------------------

Combines employee names from two tables.

Duplicate rows are removed automatically.

--------------------------------------------------*/

SELECT
    first_name,
    last_name
FROM employee_demographics

UNION

SELECT
    first_name,
    last_name
FROM employee_salary;


/*--------------------------------------------------
UNION DISTINCT
----------------------------------------------------

UNION is equivalent to UNION DISTINCT.

Duplicate rows are removed.

--------------------------------------------------*/

SELECT
    first_name,
    last_name
FROM employee_demographics

UNION DISTINCT

SELECT
    first_name,
    last_name
FROM employee_salary;


/*--------------------------------------------------
UNION ALL
----------------------------------------------------

Returns all rows, including duplicates.

--------------------------------------------------*/

SELECT
    first_name,
    last_name
FROM employee_demographics

UNION ALL

SELECT
    first_name,
    last_name
FROM employee_salary;


/*--------------------------------------------------
Practical Example
----------------------------------------------------

Categorize employees based on different criteria.

--------------------------------------------------*/


-- Employees older than 50
SELECT
    first_name,
    last_name,
    'Senior Employee' AS employee_category
FROM employee_demographics
WHERE age > 50;


/*--------------------------------------------------
Combining Multiple Result Sets
--------------------------------------------------*/

SELECT
    first_name,
    last_name,
    'Senior Female Employee' AS employee_category
FROM employee_demographics
WHERE age > 40
  AND gender = 'Female'

UNION

SELECT
    first_name,
    last_name,
    'Senior Male Employee'
FROM employee_demographics
WHERE age > 40
  AND gender = 'Male'

UNION

SELECT
    first_name,
    last_name,
    'High Salary Employee'
FROM employee_salary
WHERE salary >= 70000

ORDER BY first_name;
