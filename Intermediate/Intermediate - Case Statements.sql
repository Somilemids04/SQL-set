/*
===========================================
SQL CASE Statement
===========================================

Description:
The CASE statement allows you to implement conditional
logic within SQL queries, similar to an IF...ELSE
statement in programming languages.

Common Uses:
1. Categorizing data
2. Conditional calculations
3. Creating custom labels
4. Generating derived columns

Syntax:

CASE
    WHEN condition THEN result
    WHEN condition THEN result
    ELSE result
END

===========================================
*/


/*--------------------------------------------------
View Sample Data
--------------------------------------------------*/

SELECT *
FROM employee_demographics;


/*--------------------------------------------------
Simple CASE Statement
----------------------------------------------------

Categorize employees based on age.

--------------------------------------------------*/

SELECT
    first_name,
    last_name,
    CASE
        WHEN age <= 30 THEN 'Young'
    END AS age_category
FROM employee_demographics;


/*--------------------------------------------------
Multiple Conditions
----------------------------------------------------

Evaluate conditions in order.
The first matching condition is returned.

--------------------------------------------------*/

SELECT
    first_name,
    last_name,
    CASE
        WHEN age <= 30 THEN 'Young'
        WHEN age BETWEEN 31 AND 50 THEN 'Middle Aged'
        WHEN age > 50 THEN 'Senior'
        ELSE 'Unknown'
    END AS age_category
FROM employee_demographics;


/*--------------------------------------------------
Conditional Calculations
----------------------------------------------------

CASE statements can also perform calculations.

Example:
- Salary > 45,000  → 5% raise
- Salary < 45,000  → 7% raise

--------------------------------------------------*/

SELECT *
FROM employee_salary;


SELECT
    first_name,
    last_name,
    salary,
    CASE
        WHEN salary > 45000 THEN salary + (salary * 0.05)
        WHEN salary < 45000 THEN salary + (salary * 0.07)
        ELSE salary
    END AS revised_salary
FROM employee_salary;


/*--------------------------------------------------
Multiple CASE Statements
----------------------------------------------------

A query can contain multiple CASE expressions.

Example:
- Calculate revised salary
- Calculate department bonus

--------------------------------------------------*/

SELECT
    first_name,
    last_name,
    salary,

    CASE
        WHEN salary > 45000 THEN salary + (salary * 0.05)
        WHEN salary < 45000 THEN salary + (salary * 0.07)
        ELSE salary
    END AS revised_salary,

    CASE
        WHEN dept_id = 6 THEN salary * 0.10
        ELSE 0
    END AS bonus
FROM employee_salary;