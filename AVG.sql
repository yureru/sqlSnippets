/* How to calculate averages with teh AVG keyword. */
-- Use with Northwind db
-- Return the average quantity per order.
SELECT SalesOrderID, AVG(OrderQty)
FROM Sales.SalesOrderDetail
WHERE SalesOrderID IN (43660, 43670, 43672)
GROUP BY SalesOrderID;

-- Include how many times was an order putted (not the order quantity, the times
-- SalesOrderID appears)
SELECT SalesOrderID, COUNT(SalesOrderID), AVG(OrderQty)
FROM Sales.SalesOrderDetail
WHERE SalesOrderID IN (43660, 43670, 43672)
GROUP BY SalesOrderID;