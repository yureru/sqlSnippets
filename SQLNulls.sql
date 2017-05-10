/* SQL queries that shows how to handle null */
-- Null values, as we know, represents an absence of value, something empty.
-- Null values can't be determined wit the use of a =.
-- We need to use the IS NULL or IS NOT NULL statements to idenfity null values.

SELECT * FROM STATION_DATA
WHERE SNOW_DEPTH IS NULL;

/* Ofthen null values aren't desirable to have. The station_number column should be designed so it never
allows nulls, or else we could have orphan data that belongs to no station. 
IT might make sense to have null values for snow_depth or precipitation, though, not because it was a sunny day
(in this case is to record the values as 0), but rather because some stations might not have the neccesary instruments
to take those measurements. It might be misleading to set those values to 0 (which implies data was recorded), so
those measurements should be left null
*/

/* This shows that nulls can be ambiguous and it can be difficult to determine their business meaning.
It is important that nullable columns (coluns that allowed to have null values) have documented what a null
value means from a business perspective. Otherwhise, nulls should be banned from those table columns.
*/

/* Do not confuse nulls with empty text, which is two single quotes with nothing in them (i.e., ''). This also
applies to whitespace text (i.e., ' '). These will be treated as values and never will be considered null. A null is
definitely not the same as 0 either, because 0 is a value, whereas null is an absence of a value.
*/

-- Null values are hard to handle with where statements, think about this query
SELECT * FROM STATION_DATA
WHERE PRECIPITATION <= 0.5;

-- But what if we want to include null values as well? Because null is not 0 or any number, it will not qualify,
-- Null rarely qualify with anything and almost always get filtered out in a WHERE unless you explicitly
-- handle them, . So you have to use an OR to include nulls:
SELECT * FROM STATION_DATA
WHERE PRECIPITATION IS NULL OR PRECIPITATION <= 0.5;

-- coalesce() function takes two parameters: a possible null value and a value, if the first parameter results being null
-- it's used the second parameter as the returned value, if it's not value it uses that original value.
SELECT * FROM STATION_DATA
WHERE COALESCE(PRECIPITATION, 0) <= 0.5;

-- Coalesce can be used in SELECT statements, not just with WHERE.
-- This is helpful if you want to pretty up a report and not have null values displayed, but rather some placeholder-- for example,
-- 0, "N/A", or "None"-- which is more meaningful to most people:
SELECT REPORT_CODE, COALESCE(PRECIPITATION, 0) AS RAINFALL
FROM STATION_DATA;