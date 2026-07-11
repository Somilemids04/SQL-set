/*
===========================================
SQL Temporary Tables
===========================================

Description:
A Temporary Table is a table that exists only for
the duration of the current database session.

Temporary tables are useful for storing intermediate
results, simplifying complex queries, and improving
query readability.

Characteristics:
- Session-specific
- Automatically removed when the session ends
- Behaves like a regular table during its lifetime

===========================================
*/


/*--------------------------------------------------
Method 1: Create an Empty Temporary Table
----------------------------------------------------

Create the table structure first, then insert data.

--------------------------------------------------*/

CREATE TEMPORARY TABLE temp_table
(
    first_name     VARCHAR(50),
    last_name      VARCHAR(50),
    favorite_movie VARCHAR(100)
);


/*--------------------------------------------------
View Temporary Table
--------------------------------------------------*/

SELECT *
FROM temp_table;


/*--------------------------------------------------
Insert Data into Temporary Table
--------------------------------------------------*/

INSERT INTO temp_table
VALUES
(
    'Alex',
    'Freberg',
    'The Lord of the Rings: The Two Towers'
);


/*--------------------------------------------------
View Inserted Data
--------------------------------------------------*/

SELECT *
FROM temp_table;


/*--------------------------------------------------
Method 2: Create Temporary Table from a Query
----------------------------------------------------

Creates the table and populates it in a single step.

This is the most commonly used approach.

--------------------------------------------------*/

CREATE TEMPORARY TABLE salary_over_50k AS
    
SELECT *
FROM employee_salary
WHERE salary > 50000;


/*--------------------------------------------------
Query the Temporary Table
--------------------------------------------------*/

SELECT *
FROM salary_over_50k;
