/* SQL queries that wre used while reading Getting Started with SQL */

-- Select all columns from table
SELECT * FROM CUSTOMER;

-- Select column and column from table
SELECT CUSTOMER_ID, NAME
FROM CUSTOMER;

-- Selecciona columna, otra columna, otra columna, otra columna y multiplica su valor y crea un alias llamado TAXED_PRICE
-- desde esa tabla.
SELECT
PRODUCT_ID,
DESCRIPTIONS,
PRICE,
PRICE * 1.07 AS TAXED_PRICE
FROM PRODUCT;

-- Select two columns, create an alias from one column, use the function round() to limit a decimal
-- passing the decimal number, and the numbers to round after the decimal point, then create an alias for those values.
SELECT
PRODUCT_ID,
DESCRIPTIONS,
PRICE,
round(PRICE * 10.7, 2) AS TAXED_PRICE
FROM PRODUCT;