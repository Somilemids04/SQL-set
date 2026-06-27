/*
===========================================
SQL WHERE Clause - Filtering Records
===========================================

Description:
The WHERE clause is used to filter rows based on one or more conditions.
Only the records that satisfy the specified condition are returned.

Topics Covered:
1. Filtering numeric values
2. Comparison operators
3. Filtering text values
4. Filtering date values
5. Using the LIKE operator
6. Wildcards (% and _)
===========================================
*/

-- Retrieve employees with salary greater than 50,000
SELECT *
FROM employee_salary
WHERE salary > 50000;


-- Retrieve employees with salary greater than or equal to 50,000
SELECT *
FROM employee_salary
WHERE salary >= 50000;


-- Retrieve all female employees
SELECT *
FROM employee_demographics
WHERE gender = 'Female';


-- Retrieve employees who are not female
SELECT *
FROM employee_demographics
WHERE gender != 'Female';


-- Retrieve employees born after January 1, 1985
SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01';


/*
-------------------------------------------
LIKE Operator
-------------------------------------------

The LIKE operator is used for pattern matching.

Wildcards:
%  -> Represents zero or more characters.
_  -> Represents exactly one character.
-------------------------------------------
*/

-- Names starting with 'A'
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'A%';


-- Names starting with 'A' and exactly three characters after it
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'A___';


-- Names starting with 'A' and containing at least four characters
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'A___%';