/* Check constraints, Page 198 Onwards of SQL Server book */

-- Adds a Check constraint in a column that already exists.
-- Allows only a date that is less or same as the current one.
ALTER TABLE Customers
	ADD CONSTRAINT CN_CustomerDateInSystem
	CHECK
	(DateInSystem <= GETDATE());

-- Now we try to insert a record that violates the Check constraint we just made
INSERT INTO Customers
	(CustomerName, Address1, Address2, City, State, Zip, Contact,
		Phone, FedIDNo, DateInSystem)
VALUES
	('Customer1', 'Address1', 'Add2', 'MyCity', 'NY', '55555',
		'No Contact', '553-1212', '930984954', '12-31-2049');