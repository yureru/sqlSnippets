/* SQL queries that shows grouping conditions */

-- This might be unclear for the reader, it means: "where rain is true and (temperature <= 32 or snow_dept > 0)"
-- Or it might say: "where (rain is true and temperature <= 32) or snow_dept > 0"
-- Since we have experience we could tell, but it migh be confusing for other persons.
SELECT * FROM STATION_DATA
WHERE RAIN = 1 AND TEMPERATURE <= 32
OR SNOW_DEPTH > 0;

-- That's why it migh tbe better to group expressions with parentheses
SELECT * FROM STATION_DATA
WHERE (RAIN = 1 AND TEMPERATURE <= 32)
OR SNOW_DEPTH > 0;