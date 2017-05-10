/* How to use GROUP BY keyword */
-- Use the Northwind database.
-- Let's say that you want to know how many parts were ordered in a given set of orders:
-- Though, this shows each individual line of detail from the orders. (That is, it doesn't shows only three
-- orders with the summed quantity.)
SELECT SalesOrderID, OrderQty
FROM Sales.SalesOrderDetail
WHERE SalesOrderID IN(43660, 43670, 43672);

-- We can adding the order by either your calculator, or better using the GROUP BY clause with
-- and aggregator. In this case, we can use SUM():
SELECT SalesOrderID, SUM(OrderQty)
FROM Sales.SalesOrderDetail
WHERE SalesOrderID IN (43660, 43670, 43672)
GROUP BY SalesOrderID;

-- Remember that we can use an alias (AS) after the sum to give the name to that new column.
SELECT SalesOrderID, SUM(OrderQty) AS SumQty
FROM Sales.SalesOrderDetail
WHERE SalesOrderID IN (43660, 43670, 43672)
GROUP BY SalesOrderID;

-- Grouping based in multiple columns, here we just add a comma
-- and the next column.
-- Let's say, for example, that you're loking fir the number of orders each sales person
-- has taken for the first 10 customers.
SELECT CustomerID, SalesPersonID, COUNT(*)
FROM Sales.SalesOrderHeader
WHERE CustomerID <= 11010
GROUP BY CustomerID, SalesPersonID
Order BY CustomerID, SalesPersonID;