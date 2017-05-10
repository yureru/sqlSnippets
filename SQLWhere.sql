/* SQL queries that shows how to use the WHERE statement*/

-- Select all records from table where condition.
SELECT * FROM STATION_DATA
WHERE YEAR = 2010;

-- Select all records from station_data except where year is 2010.
-- Select all records from table where condition.
-- Condition is different to
SELECT * FROM STATION_DATA
WHERE YEAR != 2010;

-- Equivalent as above.
SELECT * FROM STATION_DATA
WHERE YEAR <> 2010;

-- Inclusive range.
SELECT * FROM STATION_DATA
WHERE YEAR BETWEEN 2005 AND 2010;

-- Range using operators, inclusive.
SELECT * FROM STATION_DATA
WHERE YEAR >= 2005 AND YEAR <= 2010;

-- Range using operators, exclusive.
SELECT * FROM STATION_DATA
WHERE YEAR > 2005 AND YEAR < 2010;