/* SQL queries that shows AND, OR, IN statements*/

-- Equivalent as using BETWEEN
SELECT * FROM STATION_DATA
WHERE YEAR >= 2005 AND YEAR <= 2010;

-- Range exclusive
SELECT * FROM STATION_DATA
WHERE YEAR > 2005 AND YEAR < 2010;

-- Picked
SELECT * FROM STATION_DATA
WHERE MONTH = 3 OR
MONTH = 6 OR
MONTH = 9 OR
MONTH = 12;

-- A more succint picked
SELECT * FROM STATION_DATA
WHERE MONTH IN(3, 6, 9, 12);

-- All except some values
SELECT * FROM STATION_DATA
WHERE MONTH NOT IN(3, 6, 9, 12);

-- "give all months where dividing by 3 gives me a remainder of 0"
SELECT * FROM STATION_DATA
WHERE MONTH % 3 = 0;

-- Filtering by text, the book says we need to use single quotes (but the SQliteStudio accepts double quotes.)
SELECT * FROM STATION_DATA
WHERE REPORT_CODE = '513A63';

-- Filtering by text also works with the IN keyword.
SELECT * FROM STATION_DATA
WHERE REPORT_CODE IN('513A63', '1F8A7B', 'EF616A');

-- Use length function to filter by length.
-- For example, if we were assigned quality control and needed to ensure every report_code was siX characters length
SELECT * FROM STATION_DATA
WHERE LENGTH(REPORT_CODE) != 6;

-- % is any number of characters and _ is a single character.
-- Say we want to find  all report codes that start with the letter 'A' you would run this statement to find 'A'
-- you would run this statement to find "A" followed by any characters.
SELECT * FROM STATION_DATA
WHERE REPORT_CODE LIKE 'A%';

-- If you wanted to find all report codes that have a "B" as the first character and "C" as the third character,
-- you would specify an underscore (_) for the second position,
-- and follow with any number of charcters after the "C":
SELECT * FROM STATION_DATA
WHERE REPORT_CODE LIKE 'B_C%';