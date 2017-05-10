/* How to perform Grouping Records */

-- Simplest aggregation: count the number of records in a table.
SELECT COUNT(*) AS RECORD_COUNT
FROM STATION_DATA;

-- Count the number of records where a tornado was present
SELECT COUNT(*) AS RECORD_COUNT FROM STATION_DATA
WHERE TORNADO = 1;

-- Separate the count by year.
SELECT YEAR, COUNT(*) AS RECORD_COUNT FROM STATION_DATA
WHERE TORNADO = 1
GROUP BY YEAR;

-- Slice data on more than one field. If we wanted a count by year and month,
-- we could group on the month field as well.
SELECT YEAR, MONTH, COUNT(*) AS RECORD_COUNT FROM STATION_DATA
WHERE TORNADO = 1
GROUP BY YEAR, MONTH;

-- Usage of ordinal positions instead of specifying the columns in the GROUP BY
-- Allow us to avoid rewrite the column's names when they're too long, and helps to build a more succint statement.
-- You can't use this feature with Oracle or SQL Server.
SELECT YEAR, MONTH, COUNT(*) AS RECORD_COUNT FROM STATION_DATA
WHERE TORNADO = 1
GROUP BY 1, 2;

/* If you're more interested in recent data and would like it at the top.
By default, sorting is done with the ASC operator, which orders the data in ascending order.
If you want to sort by descending order, aply the DESC operator operator to the ordering of year to make more
recent records appear at the top of the results
*/
SELECT YEAR, MONTH, COUNT(*) AS RECORD_COUNT FROM STATION_DATA
WHERE TORNADO = 1
GROUP BY YEAR, MONTH
ORDER BY YEAR DESC, MONTH;


