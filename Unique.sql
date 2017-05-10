/* Unique constraints. From page 196 onwards of SQL Server book. */

-- Create a Shippers table with one UNIQUE constraint.
CREATE TABLE Shippers
(
	ShipperID		int		IDENTITY	NOT NULL
		PRIMARY KEY,
	ShipperName		varchar(30)			NOT NULL,
	Address			varchar(30)			NOT NULL,
	City			varchar(25)			NOT NULL,
	State			char(2)				NOT NULL,
	Zip				varchar(10)			NOT NULL,
	PhoneNo			varchar(14)			NOT NULL
		UNIQUE
);

-- Just to make sure the constraints were created prorperly.
EXEC sp_helpconstraint Shippers;

-- Creates a UNIQUE constraint on an existing table.
ALTER TABLE Employees
	ADD CONSTRAINT AK_EmployeeSSN
	UNIQUE (SSN);