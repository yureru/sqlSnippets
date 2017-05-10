/* SQL Aggregate Functions. Can be used to perform some sort of calculation on a specific column */

-- Count can be used for other purpose other than simply counting records.
-- If we specify a column instead of an asterisk, it will count the number of non-null values
-- in that column.
SELECT COUNT(SNOW_DEPTH) AS RECORDED_SNOW_DEPTH_COUNT
FROM STATION_DATA;

/* Note:
	Aggregate functions such as COUNT(), SUM(), AVG(), MIN(), and MAX() will never include null
	values in their calculations. Only non-null values will be considered.
*/

-- Find the average temperature for each month since 2000.
SELECT MONTH, AVG(TEMPERATURE) AS AVG_TEMP
FROM STATION_DATA
WHERE YEAR >= 2000
GROUP BY MONTH;

-- As always, you can use functions on the aggregated values and perform tasks such as
-- rounding to make them look nicer.
SELECT MONTH, ROUND(AVG(TEMPERATURE), 2) AS AVG_TEMP
FROM STATION_DATA
WHERE YEAR >= 2000
GROUP BY MONTH;

-- SUM() is another common aggregate operation. To find the sum of snow depth 
-- by year since 2000, run this query:
SELECT YEAR, SUM(SNOW_DEPTH) AS TOTAL_SNOW
FROM STATION_DATA
WHERE YEAR >= 2000
GROUP BY YEAR;

-- There is no limitation on how many aggregate operations you can use in a single query.
-- Here we find the TOTAL_SNOW and TOTAL_PRECIPITATION for each year
-- since 2000 in a single query, as well as the MAX_PRECIPITATION:
SELECT YEAR,
SUM(SNOW_DEPTH) AS TOTAL_SNOW,
SUM(PRECIPITATION) AS TOTAL_PRECIPITATION,
MAX(PRECIPITATION) AS MAX_PRECIPITATION
FROM STATION_DATA
WHERE YEAR >= 2000
GROUP BY YEAR;

-- You can achieve some very specific aggregations by leveraging the WHERE. If you wanted the total
-- precipitation BY YEAR when a tornado was present, you can do something like this:
SELECT YEAR,
SUM(PRECIPITATION) AS TORNADO_PRECIPITATION
FROM STATION_DATA
WHERE TORNADO = 1
GROUP BY YEAR;
