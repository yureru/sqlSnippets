/* Usage of HAVING statement, it's useful to filter by aggregations, since WHERE only filters records */
-- Page 61 onwards

-- Trying to filter using a WHERE on an aggregation.
-- Note that this will not work and will show an error similar to:
-- [14:53:37] Error while executing SQL query on database 'weather_stations': misuse of aggregate: SUM()
/* This doesn't works because you cannot filter on aggregate fields using WHERE, check p. 61 for more info.*/
SELECT YEAR,
SUM(PRECIPITATION) AS TOTAL_PRECIPITATION
FROM STATION_DATA
WHERE TOTAL_PRECIPITATION > 30
GROUP BY YEAR;

-- How to use HAVING statement to filter an aggregate field
SELECT YEAR,
SUM(PRECIPITATION) AS TOTAL_PRECIPITATION
FROM STATION_DATA
GROUP BY YEAR
HAVING TOTAL_PRECIPITATION > 30;

/* Note:
	HAVING is the aggregated equivalent of WHERE. The WHERE keyword filters individual records,
	but HAVING filters aggregations.
*/

-- Note that some platforms, including Oracle, do not support aliases in the HAVING statement
-- (just like GROUP BY). This means you must specify the aggregate function again in the HAVING
-- statement. If you were running the preceding query on a Oracle database, you would have to write
-- it like this.
SELECT YEAR,
SUM(PRECIPITATION) AS TOTAL_PRECIPITATION
FROM STATION_DATA
GROUP BY YEAR
HAVING SUM(PRECIPITATION) > 30;


