/* SQL queries that shows how case statements (switch) */
/* A CASE statement allows us to map one or more conditions to a corresponding value for each condition.
   You start a CASE statement with the word CASE and conclude it with an END. Between those keywords, you specify
   each condition with a WHEN [condition] THEN [value], where the [condition] and the corresponding [value] are
   supplied by you. After specifying the condigion-value pairs, you can have a catchall value to default to if
   none of the conditions were met, which is specified in the ELSE.
*/

-- Categorize wind_speed into wind_severity, where any speed greater than 40 is 'HIGH', 30 to 40 is 'MODERATE'
-- and anything less is 'LOW'
SELECT REPORT_CODE, YEAR, MONTH, DAY, WIND_SPEED,
CASE
	WHEN WIND_SPEED > 40 THEN 'HIGH'
	WHEN WIND_SPEED >= 30 AND WIND_SPEED <= 40 THEN 'MODERATE'
	ELSE 'LOW'
END AS WIND_SEVERITY
FROM STATION_DATA;

-- Select year, categorize wind speed, count all the records from table, then group by year and wind_severity
-- (with ordinal positions). This group will also group the count.
-- Book query explanation: We can group on year and wind_severity and get a count of records for each
-- one as shown here.
SELECT YEAR, 
CASE
	WHEN WIND_SPEED >= 40 THEN 'HIGH'
	WHEN WIND_SPEED >= 30 THEN 'MODERATE'
	ELSE 'LOW'
END AS WIND_SEVERITY,

COUNT(*) AS RECORD_COUNT
FROM STATION_DATA
GROUP BY 1, 2;

-- Page 65 explains the "Zero/Null" CASE trick, which is basically a way to create two or more alias in the CASE
-- statement based on different conditions, because this can't be done with a WHERE.
-- Say you wanted to aggregate precipitation into two sums, tornado_precipitation and non_tornado_precipitation, and GROUP BY year and month.
-- Since this depends on two fields, we cannot do this with a WHERE statement unless you do two separate queries (one for tornado
-- being true and the other false):

-- Tornado precipitation:
SELECT YEAR, MONTH,
SUM(PRECIPITATION) AS TORNADO_PRECIPITATION
FROM STATION_DATA
WHERE TORNADO = 1
GROUP BY YEAR, MONTH;

-- Non-tornado precipitation:
SELECT YEAR, MONTH,
SUM(PRECIPITATION) AS TORNADO_PRECIPITATION
FROM STATION_DATA
WHERE TORNADO = 0
GROUP BY YEAR, MONTH;

-- The before can be re-written in a single query by using a CASE statement.
SELECT YEAR, MONTH,
SUM(CASE WHEN TORNADO = 1 THEN PRECIPITATION ELSE 0 END) AS TORNADO_PRECIPITATION,
SUM(CASE WHEN TORNADO = 0 THEN PRECIPITATION ELSE 0 END) AS NON_TORNADO_PRECIPITATION

FROM STATION_DATA
GROUP BY YEAR, MONTH;

-- Find the maximum precipitation when tornadoes were present and when they were not.
SELECT YEAR,
MAX(CASE WHEN TORNADO = 1 THEN PRECIPITATION ELSE NULL END) AS MAX_TORNADO_PRECIPITATION,
MAX(CASE WHEN TORNADO = 0 THEN PRECIPITATION ELSE NULL END) AS MAX_NON_TORNADO_PRECIPITATION

FROM STATION_DATA
GROUP BY YEAR;

-- Find the average temperatures by month when rain/hail was present versus not present after the year 2000
SELECT MONTH,
AVG(CASE WHEN RAIN OR HAIL THEN TEMPERATURE ELSE NULL END) AS AVG_PRECIPITATION_TEMP,
AVG(CASE WHEN (RAIN OR HAIL) THEN TEMPERATURE ELSE NULL END) AS AVG_NON_PRECIPITATION_TEMP

FROM STATION_DATA
GROUP BY MONTH;