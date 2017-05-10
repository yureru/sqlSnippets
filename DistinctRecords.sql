/* Using the DISTINCT keyword to avoid getting duplicated values */

-- Suppose we want to get a distinct list of the STATION_NUMBER values?
-- If we run this query, we will get duplicates:
SELECT STATION_NUMBER FROM STATION_DATA;

-- If we want a distinct list of station numbers without any duplicates, we can use the DISTINCT keyword:
SELECT DISTINCT STATION_NUMBER FROM STATION_DATA;

-- We can also get distinct results for more than one column. Just include both of those columns
-- in the SELECT statement.
SELECT DISTINCT STATION_NUMBER, YEAR FROM STATION_DATA;