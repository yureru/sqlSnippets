/* How to use the INSERT keyword */
-- Use the AdventureWorks2012 db, with the script that created Stores and Sales.

-- Inserts a row with ordinal position values.
-- If you try to run this more than one time, you will get an error since
-- the table has a primary key that does not allow duplicate values for the
-- StoreCode field. If you changed that one field, you could have left the rest
-- of the columns alone, and it would have taken the new row.
INSERT INTO Stores
VALUES
	('TEST', 'Test Store', '1234 Anywhere Street', 'Here', 'NY', '00319');
	
-- Using specific columns for an INSERT
-- Note that we are leaving the Adress column without a value, therefore in this case is NULL.
INSERT INTO Stores
	(StoreCode, Name, City, State, Zip)
VALUES
	('TST2', 'Test Store', 'Here', 'NY', '00319');
	
-- Inserts a row into the Sales table, it needs to match the Foreign Key (FK) StoreCode.
-- Note: When specifying the parameter list you can change the order.
INSERT INTO Sales
	(OrderNumber, StoreCode, OrderDate, Quantity, Terms, TitleID)
VALUES
	('18234', 'TEST', '2016/04/11', 7, 'Wholesale', 10);
	
-- Multi-row inserts
-- Since SQL Server 2008 you can use this feature.
INSERT INTO Sales
	(StoreCode, OrderNumber, OrderDate, Quantity, Terms, TitleID)
VALUES
	('TST2', 'TESTORDER2', '01/01/1999', 10, 'NET 30', 1234567),
	('TST2', 'TESTORDER3', '02/01/1999', 10, 'NET 30', 1234567);
	
-- exercises from chapter 3
INSERT INTO Production.Location
	(Name, CostRate, Availability, ModifiedDate)
VALUES('Soldering', 11.95, 110.00, 2016-11-05);
