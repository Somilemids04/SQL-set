/*
===========================================
SQL HAVING vs WHERE Clause
===========================================

Description:
Both the WHERE and HAVING clauses are used to filter data,
but they operate at different stages of query execution.

WHERE:
- Filters individual rows before grouping.
- Cannot use aggregate functions.

HAVING:
- Filters grouped data after the GROUP BY clause.
- Can use aggregate functions such as AVG(), SUM(), COUNT(), MIN(), and MAX().

Topics Covered:
1. WHERE clause
2. HAVING clause
3. Aggregate functions
4. Filtering grouped results
===========================================
*/


/*--------------------------------------------------
GROUP BY without Filtering
--------------------------------------------------*/

-- Calculate the average age for each gender
SELECT
    gender,
    AVG(age) AS average_age
FROM employee_demographics
GROUP BY gender;


/*--------------------------------------------------
WHERE Clause with Aggregate Function (Invalid)
--------------------------------------------------

The WHERE clause executes before GROUP BY.

Since aggregate values do not exist at this stage,
aggregate functions cannot be used inside WHERE.

--------------------------------------------------*/

SELECT
    gender,
    AVG(age)
FROM employee_demographics
WHERE AVG(age) > 40      -- Invalid
GROUP BY gender;


/*--------------------------------------------------
HAVING Clause
--------------------------------------------------

The HAVING clause executes after GROUP BY,
allowing grouped results to be filtered using
aggregate functions.

--------------------------------------------------*/

-- Filter groups where the average age is greater than 40
SELECT
    gender,
    AVG(age) AS average_age
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40;


-- Using the column alias in the HAVING clause
SELECT
    gender,
    AVG(age) AS average_age
FROM employee_demographics
GROUP BY gender
HAVING average_age > 40;