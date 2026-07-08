/*
===========================================
SQL String Functions
===========================================

Description:
String functions are used to manipulate, transform,
and analyze text values in SQL.

Common Uses:
1. Converting text case
2. Removing whitespace
3. Extracting characters 
4. Replacing text
5. Searching within strings
6. Concatenating strings

===========================================
*/


/*--------------------------------------------------
LENGTH()
----------------------------------------------------

Returns the number of characters in a string.

--------------------------------------------------*/

SELECT LENGTH('SQL');

SELECT
    first_name,
    LENGTH(first_name) AS name_length
FROM employee_demographics;


/*--------------------------------------------------
UPPER()
----------------------------------------------------

Converts all characters to uppercase.

--------------------------------------------------*/

SELECT UPPER('sql');

SELECT
    first_name,
    UPPER(first_name) AS uppercase_name
FROM employee_demographics;


/*--------------------------------------------------
LOWER()
----------------------------------------------------

Converts all characters to lowercase.

--------------------------------------------------*/

SELECT LOWER('SQL');

SELECT
    first_name,
    LOWER(first_name) AS lowercase_name
FROM employee_demographics;


/*--------------------------------------------------
TRIM()
----------------------------------------------------

Removes leading and trailing whitespace.

--------------------------------------------------*/

SELECT TRIM('   SQL Tutorial   ');


/*--------------------------------------------------
LTRIM()
----------------------------------------------------

Removes whitespace from the left side only.

--------------------------------------------------*/

SELECT LTRIM('     I love SQL');


/*--------------------------------------------------
RTRIM()
----------------------------------------------------

Removes whitespace from the right side only.

--------------------------------------------------*/

SELECT RTRIM('I love SQL     ');


/*--------------------------------------------------
LEFT()
----------------------------------------------------

Returns the specified number of characters
from the beginning of a string.

--------------------------------------------------*/

SELECT LEFT('Alexander', 4);

SELECT
    first_name,
    LEFT(first_name, 4) AS first_four_characters
FROM employee_demographics;


/*--------------------------------------------------
RIGHT()
----------------------------------------------------

Returns the specified number of characters
from the end of a string.

--------------------------------------------------*/

SELECT RIGHT('Alexander', 6);

SELECT
    first_name,
    RIGHT(first_name, 4) AS last_four_characters
FROM employee_demographics;


/*--------------------------------------------------
SUBSTRING()
----------------------------------------------------

Extracts a portion of a string.

Syntax:
SUBSTRING(string, start_position, length)

--------------------------------------------------*/

SELECT SUBSTRING('Alexander', 2, 3);

SELECT
    birth_date,
    SUBSTRING(birth_date, 1, 4) AS birth_year
FROM employee_demographics;


/*--------------------------------------------------
REPLACE()
----------------------------------------------------

Replaces occurrences of a substring
with another substring.

--------------------------------------------------*/

SELECT
    first_name,
    REPLACE(first_name, 'a', 'z') AS modified_name
FROM employee_demographics;


/*--------------------------------------------------
LOCATE()
----------------------------------------------------

Returns the position of the first occurrence
of a substring within a string.

Returns:
0 -> Not found

--------------------------------------------------*/

SELECT LOCATE('x', 'Alexander');

SELECT LOCATE('e', 'Alexander');

SELECT
    first_name,
    LOCATE('a', first_name) AS position_of_a
FROM employee_demographics;

SELECT
    first_name,
    LOCATE('Mic', first_name) AS search_result
FROM employee_demographics;


/*--------------------------------------------------
CONCAT()
----------------------------------------------------

Combines two or more strings into one.

--------------------------------------------------*/

SELECT CONCAT('Alex', ' ', 'Freberg');

SELECT
    CONCAT(first_name, ' ', last_name) AS full_name
FROM employee_demographics;
