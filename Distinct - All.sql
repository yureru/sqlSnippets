/* How to use DISTINCT and ALL Predicates */
-- Use with the Northwind
/* Let's say, for example, that you wanted a list of the IDs for all the products that you have
sold at least 30 of in an individual sale (more than 30 at one time). You can easily get that information 
from  the SalesOrderDetail table with the following query:
*/
-- Note that it shows repeated sales when that product was sold more than 30 items in several times.
SELECT ProductID
FROM Sales.SalesOrderDetail
WHERE OrderQty > 30;

-- So I thought about it and came with a solution using GROUP BY, but the book
-- uses a DISTINCT keyword to aachieve the same. Would they be performace differences?
SELECT ProductID
FROM Sales.SalesOrderDetail
WHERE OrderQTY > 30
GROUP BY ProductID;

-- Book's example
SELECT DISTINCT ProductID
FROM Sales.SalesOrderDetail
WHERE OrderQTY > 30;

-- DISTINCT can be used as more than just a predicate for a SELECT statement. 
-- It can also be used in the expression for an aggregate. What do I mean? Let's compare three queries:
-- 1. Gran a row count for the SalesOrderDetail table:
SELECT COUNT(*)
FROM Sales.SalesOrderDetail;

-- 2. Nor run the same query using a specific column to count.
-- SalesOrderID column is part of the key for this table, so it can't contain null values
-- and therefore it's the returns the same count as the above query.
SELECT COUNT(SalesOrderID)
FROM Sales.SalesOrderDetail;

-- 3. Now this gets the count of distinct items.
-- All duplicate rows were eliminated before the aggregation occured, so we have
-- sunstantially fewer rows.
SELECT COUNT(DISTINCT SalesOrderID)
FROM Sales.SalesOrderDetail;
