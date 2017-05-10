/* SQL queries that shows the use of booleans*/

-- MySQL allows the use of the true and false keywords, but SQLite doesn't.
SELECT * FROM STATION_DATA
WHERE TORNADO = TRUE AND HAIL = TRUE;

-- Equivalent as before but this works with SQLite,
SELECT * FROM STATION_DATA
WHERE TORNADO = 1 AND HAIL = 1;

-- We don't even to use the comparing operator and the literal when working with booleans.
-- Because the fields are aleardy Boolean. Hence you can achieve the same results by using this query.
SELECT * FROM STATION_DATA
WHERE TORNADO AND HAIL;

-- However, qualifyng for false conditions needs to be explicit. To get all records with no tornado
-- but with hail, run this query.
SELECT * FROM STATION_DATA
WHERE TORNADO = 0 AND HAIL = 1;

-- We can also use the NOT keyword to qualify tornado as false:
SELECT * FROM STATION_DATA
WHERE NOT TORNADO AND HAIL;