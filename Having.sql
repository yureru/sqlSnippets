/* An example of HAVING statements */
-- Use Northwind db.
-- Note that SQL Server doesn't supports aliases in the HAVING.
SELECT ManagerID as Manager, COUNT(*) AS Reports
FROM HumanResources.Employee2
WHERE EmployeeID != 5
GROUP BY ManagerID
HAVING COUNT(*) > 3;