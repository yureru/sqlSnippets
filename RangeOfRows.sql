o/* Examples for how to get a range of records (rows).
   For example: Get the first 5 elements, or Get 10 elements starting at the 50 element. */

-- For SQLite
-- This gets the first 100 records, so it counts from 1 to 100, where 1 is the first element
SELECT * FROM table LIMIT 100;

-- This gets a range, gets 200 records beginning with row 101.
-- Note that in this case the counting starts at the element 0. So the left number of the LIMIT
-- is actually the n + 1 element.
SELECT * FROM table LIMIT 100, 200;


-- For SQL Server
-- Check: http://stackoverflow.com/questions/13422613/return-rows-between-a-specific-range-with-one-select-statement