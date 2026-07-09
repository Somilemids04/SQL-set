/*
===========================================
SQL Stored Procedures
===========================================

Description:
A Stored Procedure is a precompiled collection of
SQL statements stored in the database.

Stored procedures can be executed whenever needed,
making SQL code reusable, easier to maintain,
and more secure.

Common Uses:
1. Reusable business logic
2. Complex SQL operations
3. Data validation
4. Batch processing
5. Performance optimization

===========================================
*/


/*--------------------------------------------------
Basic Query
----------------------------------------------------

A simple query that retrieves employees
earning at least 60,000.

--------------------------------------------------*/

SELECT *
FROM employee_salary
WHERE salary >= 60000;


/*--------------------------------------------------
Creating a Simple Stored Procedure
--------------------------------------------------*/

CREATE PROCEDURE large_salaries()
SELECT *
FROM employee_salary
WHERE salary >= 60000;


/*--------------------------------------------------
Executing a Stored Procedure
--------------------------------------------------*/

CALL large_salaries();


/*--------------------------------------------------
Stored Procedure with Multiple Statements
----------------------------------------------------

Multiple SQL statements require:
1. DELIMITER
2. BEGIN
3. END

--------------------------------------------------*/

DELIMITER $$

CREATE PROCEDURE large_salaries2()
BEGIN

    SELECT *
    FROM employee_salary
    WHERE salary >= 60000;

    SELECT *
    FROM employee_salary
    WHERE salary >= 50000;

END $$

DELIMITER ;


/*--------------------------------------------------
Execute Stored Procedure
--------------------------------------------------*/

CALL large_salaries2();


/*--------------------------------------------------
Drop Existing Procedure
----------------------------------------------------

Useful when recreating procedures.

--------------------------------------------------*/

USE parks_and_recreation;

DROP PROCEDURE IF EXISTS large_salaries3;


/*--------------------------------------------------
Create Stored Procedure
--------------------------------------------------*/

DELIMITER $$

CREATE PROCEDURE large_salaries3()
BEGIN

    SELECT *
    FROM employee_salary
    WHERE salary >= 60000;

    SELECT *
    FROM employee_salary
    WHERE salary >= 50000;

END $$

DELIMITER ;


/*--------------------------------------------------
Execute Procedure
--------------------------------------------------*/

CALL large_salaries3();


/*--------------------------------------------------
Stored Procedure with Parameters
----------------------------------------------------

Parameters allow dynamic input values.

Syntax:

CREATE PROCEDURE procedure_name(parameter datatype)

--------------------------------------------------*/

USE parks_and_recreation;

DROP PROCEDURE IF EXISTS employee_salary_by_id;

DELIMITER $$

CREATE PROCEDURE employee_salary_by_id (
    IN employee_id_param INT
)
BEGIN

    SELECT *
    FROM employee_salary
    WHERE employee_id = employee_id_param
      AND salary >= 60000;

END $$

DELIMITER ;


/*--------------------------------------------------
Execute Procedure with Parameter
--------------------------------------------------*/

CALL employee_salary_by_id(1);