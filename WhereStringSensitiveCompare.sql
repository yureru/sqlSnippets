/* Way to specify a condition with a sensitive case compare */
-- Use the Northwind database.
SELECT Name, ProductNumber, ReorderPoint
FROM Production.Product
WHERE Name = 'LL Grip Tape' COLLATE SQL_Latin1_General_CP1_CS_AS;