/* Way to specify the lexicographic order by a column */
-- It orders it by the ProductID column.
-- Use with the AdventureWorks2012 database.
SELECT ProductID, Name, ProductNumber
FROM Production.Product;
ORDER BY ProductID;

-- Select name and salespersonid, where the first letter of name is between 'g' and 'j'
-- and if salespersonid is more than 283, then order it by salespersonid, then suborder it name by descending order.
-- remember that the default order is by ASC instead of DESC
SELECT Name, SalesPersonID
FROM Sales.Store
WHERE Name BETWEEN 'g' AND 'j'
	AND SalesPersonID > 283
ORDER BY SalesPersonID, Name DESC;