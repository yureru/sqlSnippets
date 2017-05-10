/* SQL querys that shows how to perform concatenations
*/
-- Select column, and select column then concatenate string and concatenate a column,
-- then create an alias from this given value, from table.
SELECT NAME,
CITY || ", " || STATE AS LOCATION
FROM CUSTOMER;

-- Concatenates several values as SHIP_ADRESS alias
-- Note that ZIP is an integer, and therefore is converted to string before concatenating
-- Concatenation should work with any data type and treat it as text when merging.
/* Note: Many database platforms use double pipes to concatenate, but MySQL and some others
require using a CONCAT() function.
*/
SELECT NAME,
STREET_ADDRESS || " " || CITY || ", " || STATE || " " || ZIP AS SHIP_ADDRESS
FROM CUSTOMER;