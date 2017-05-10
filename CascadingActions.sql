/* Cascading Actions. From page 188 onwards of SQL Server book
   Cascading are automatic deletions and updates that happens to PK and FK that references other records.
 */
-- General note: I think SQL Server increments a Primary Key even when the insert fails, we haven't tested this but
-- we got some errors due the "dependency chains" while inserting, and that's why I think this increment happens.
-- Page 193 describes other types of cascading actions: SET NULL and SET DEFAULT.

 -- Note that here we put the constraints for the PK and FK at the end (instead after the key definition) to help readability.
CREATE TABLE OrderDetails
(
	OrderID 			int				NOT NULL,
	PartNo				varchar(10)		NOT NULL,
	Description			varchar(25)		NOT NULL,
	UnitPrice			money			NOT NULL,
	Qty					int				NOT NULL,
	CONSTRAINT	PK_OrderDetails
		PRIMARY KEY		(OrderID, PartNo),
	CONSTRAINT 	FK_OrderContainsDetails
		FOREIGN KEY 	(OrderID)
			REFERENCES 	Orders(OrderID)
			ON UPDATE 	NO ACTION -- This and next line are referential integrity actions
			ON DELETE	CASCADE
);
/* A referential integrity action is what you want to have happen whenever the referential integrity rule you've defined is invoked. */


-- An insert that causes a dependency chain. See page 190.
INSERT INTO OrderDetails
VALUES
	(1, '4X4525', 'This is a part', 25.00, 2);


-- In order to get our row into the OrderDetails table, we must also have a record already in the Orders table. Unfortunately,
-- getting a row into the Orders table requires that you have one in the Customers table (remember that foreign key you built on Orders?).
-- So, let's take care of it a step at a time:
INSERT INTO Customers
VALUES
	(
	'Billy Bob''s Shoes',
	'123 Main St.',
	' ',
	'Vancouver',
	'WA',
	'98685',
	'Billy Bob',
	'(360) 555-1234',
	'931234567',
	GETDATE()
	);

-- Now we can insert into the Orders table
INSERT INTO Orders
	(CustomerNo, OrderDate, EmployeeID)
VALUES -- Assuming the CustomerID of the row you just entered was 1
	(1, GETDATE(), 1);

-- Now we can insert data into OrderDetails
-- Note that we used 4 for the ID instead of 1, this is due increments on PK. Check general note at the starting of this file.
INSERT INTO OrderDetails
VALUES
	(1, '4X4525', 'This is a part', 25.00, 2),
	(1, '0R2400', 'This is another part', 50.00, 2);


--  Now that we have entered the data, take a look at the effect a CASCADE has on that data. Go ahead
-- and delete a row from the Orders table, and then see what happens in OrderDetails:
-- Note that here we should use the id 4 instead of 1.
USE Accounting

-- First, look at the rows in both tables
SELECT * FROM Orders;

SELECT * FROM OrderDetails;

-- Now delete the Order record
DELETE Orders
WHERE OrderID = 4;

-- Finally, look at both sets of data again
-- and see the CASCADE effect
SELECT * FROM Orders;

SELECT * FROM OrderDetails;
-- Notice that eve though you issued a DELETE against the Orders table only, the DELETE also
-- cascaded to your matching records in the Orderdetails table. Records in both tables were deleted.