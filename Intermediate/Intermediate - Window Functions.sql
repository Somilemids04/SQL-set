/*
===========================================
SQL Window Functions
===========================================

Description:
Window functions perform calculations across a set
of rows related to the current row without reducing
the number of rows returned.

Unlike GROUP BY, window functions preserve every row
while allowing aggregate and ranking calculations.

Common Uses:
1. Running totals
2. Moving averages
3. Ranking records
4. Comparing values within groups
5. Statistical analysis

===========================================
*/


/*--------------------------------------------------
Sample Data
--------------------------------------------------*/

SELECT *
FROM employee_demographics;


/*--------------------------------------------------
GROUP BY vs Window Functions
----------------------------------------------------

GROUP BY returns one row per group.

--------------------------------------------------*/

SELECT
    gender,
    ROUND(AVG(salary), 1) AS average_salary
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
    ON dem.employee_id = sal.employee_id
GROUP BY gender;


/*--------------------------------------------------
Window Function: OVER()
----------------------------------------------------

Calculates the overall average salary while
keeping every employee record.

--------------------------------------------------*/

SELECT
    dem.employee_id,
    dem.first_name,
    dem.gender,
    sal.salary,
    AVG(salary) OVER () AS overall_average_salary
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
    ON dem.employee_id = sal.employee_id;


/*--------------------------------------------------
PARTITION BY
----------------------------------------------------

Divides the result set into partitions and
performs calculations independently for each group.

--------------------------------------------------*/

SELECT
    dem.employee_id,
    dem.first_name,
    dem.gender,
    sal.salary,
    AVG(salary) OVER (
        PARTITION BY gender
    ) AS average_salary_by_gender
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
    ON dem.employee_id = sal.employee_id;


/*--------------------------------------------------
Running Total
----------------------------------------------------

ORDER BY inside OVER() creates a cumulative
(running) total.

--------------------------------------------------*/

SELECT
    dem.employee_id,
    dem.first_name,
    dem.gender,
    sal.salary,
    SUM(salary) OVER (
        PARTITION BY gender
        ORDER BY dem.employee_id
    ) AS running_salary_total
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
    ON dem.employee_id = sal.employee_id;


/*--------------------------------------------------
ROW_NUMBER()
----------------------------------------------------

Assigns a unique sequential number to each row.

--------------------------------------------------*/

SELECT
    dem.employee_id,
    dem.first_name,
    dem.gender,
    sal.salary,
    ROW_NUMBER() OVER (
        PARTITION BY gender
    ) AS row_number
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
    ON dem.employee_id = sal.employee_id;


/*--------------------------------------------------
ROW_NUMBER() with ORDER BY
----------------------------------------------------

Ranks employees by salary within each gender.

--------------------------------------------------*/

SELECT
    dem.employee_id,
    dem.first_name,
    dem.gender,
    sal.salary,
    ROW_NUMBER() OVER (
        PARTITION BY gender
        ORDER BY salary DESC
    ) AS row_number
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
    ON dem.employee_id = sal.employee_id;


/*--------------------------------------------------
ROW_NUMBER() vs RANK()
----------------------------------------------------

ROW_NUMBER()
- Always assigns unique numbers.

RANK()
- Assigns the same rank for ties.
- Skips the next ranking position.

--------------------------------------------------*/

SELECT
    dem.employee_id,
    dem.first_name,
    dem.gender,
    sal.salary,

    ROW_NUMBER() OVER (
        PARTITION BY gender
        ORDER BY salary DESC
    ) AS row_number,

    RANK() OVER (
        PARTITION BY gender
        ORDER BY salary DESC
    ) AS salary_rank

FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
    ON dem.employee_id = sal.employee_id;


/*--------------------------------------------------
DENSE_RANK()
----------------------------------------------------

Similar to RANK(), but does not skip ranking
numbers after ties.

Example:

Salary   RANK   DENSE_RANK
90000      1         1
80000      2         2
80000      2         2
70000      4         3

--------------------------------------------------*/

SELECT
    dem.employee_id,
    dem.first_name,
    dem.gender,
    sal.salary,

    ROW_NUMBER() OVER (
        PARTITION BY gender
        ORDER BY salary DESC
    ) AS row_number,

    RANK() OVER (
        PARTITION BY gender
        ORDER BY salary DESC
    ) AS salary_rank,

    DENSE_RANK() OVER (
        PARTITION BY gender
        ORDER BY salary DESC
    ) AS dense_salary_rank

FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
    ON dem.employee_id = sal.employee_id;