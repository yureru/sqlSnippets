/* Default constraints, Page 199 onwards of SQL Server book */
CREATE TABLE Shippers
(
	ShipperID			int			IDENTITY	NOT NULL
		PRIMARY KEY,
	ShipperName			varchar(30)				NOT NULL,
	DateInSystem		smalldatetime			NOT NULL
		DEFAULT GETDATE()
);

-- use the command to know what we did
sp_helpconstraint Shippers;

INSERT INTO Shippers
	(ShipperName)
VALUES
	('United Parcel Service');

-- Get the inserted record
SELECT * FROM Shippers;

-- Adds a DEFAULT Constraint, which is pretty much the same as the other
-- constraints but it uses the FOR keyword to specify the target column to
-- apply the Default.
ALTER TABLE Customers
	ADD CONSTRAINT CN_CustomerDefaultDateInSystem
		DEFAULT GETDATE() FOR DateInSystem;

-- Adds a default constraint for the Address1 column
ALTER TABLE Customers
	ADD CONSTRAINT CN_CustomerAddress
		DEFAULT 'UNKNOWN' FOR Address1;

-- Remember: As with all constraints except for a PRIMARY KEY, you are able to add
-- more than one per table.