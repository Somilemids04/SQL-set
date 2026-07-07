/*
===========================================
SQL SELECT Statement - Basic Examples
===========================================

Description:
The SELECT statement is used to retrieve data from one or more columns in a table.
You can select all columns, specific columns, perform calculations, and return
unique values using DISTINCT in SQL.

Topics Covered:
1. Selecting all columns
2. Selecting specific columns
3. Formatting SELECT queries
4. Using expressions and calculations
5. Order of mathematical operations (PEMDAS)
6. Removing duplicate values with DISTINCT
===========================================
*/

-- Select all columns
SELECT *
FROM employee_demographics;


-- Select a single column
SELECT first_name
FROM employee_demographics;


-- Select multiple columns
SELECT first_name,
       last_name
FROM employee_demographics;


-- Column order can be changed
SELECT last_name,
       first_name,
       gender,
       age
FROM employee_demographics;


-- formatted SELECT statement
SELECT
    last_name,
    first_name,
    gender,
    age
FROM employee_demographics;


-- Using calculations in SELECT
SELECT
    first_name,
    last_name,
    total_money_spent,
    total_money_spent + 100 AS updated_total
FROM customers;


-- Salary calculation
SELECT
    first_name,
    last_name,
    salary,
    salary + 100 AS increased_salary
FROM employee_salary;


-- Using parentheses (PEMDAS)
SELECT
    first_name,
    last_name,
    salary,
    (salary + 100) * 10 AS calculated_salary
FROM employee_salary;


-- Display all department IDs
SELECT department_id
FROM employee_salary;


-- Display only unique department IDs
SELECT DISTINCT department_id
FROM employee_salary;
