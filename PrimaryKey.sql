/* Primary Key creation */
-- Page 180 onwards.
-- Note that this sets the IDENTITY but not the as PK
CREATE TABLE Customers
(
	CustomerNo		int		IDENTITY	NOT NULL,
	CustomerName	varchar(30)			NOT NULL,
	Address1		varchar(30)			NOT NULL,
	Address2		varchar(30)			NOT NULL,
	City			varchar(20)			NOT NULL,
	State			char(2)				NOT NULL,
	Zip				varchar(10)			NOT NULL,
	Contact			varchar(25)			NOT NULL,
	Phone			char(15)			NOT NULL,
	FedIDNo			varchar(9)			NOT NULL,
	DateInSystem	smalldatetime		NOT NULL
);

-- To alter the previous query to include a PRIMARY KEY constraint, just add the constraint
-- information right after the column(s) that you want to be part of your primary key.
USE ACCOUNTING;

CREATE TABLE Customers
(
	CustomerNo		int		IDENTITY	NOT NULL
		PRIMARY KEY,
	CustomerName	varchar(30)			NOT NULL,
	Address1		varchar(30)			NOT NULL,
	Address2		varchar(30)			NOT NULL,
	City			varchar(20)			NOT NULL,
	State			char(2)				NOT NULL,
	Zip				varchar(10)			NOT NULL,
	Contact			varchar(25)			NOT NULL,
	Phone			char(15)			NOT NULL,
	FedIDNo			varchar(9)			NOT NULL,
	DateInSystem	smalldatetime		NOT NULL
);

-- What if we already have the table, and want to add a Primary Key?
USE ACCOUNTING
ALTER TABLE Employees
	ADD CONSTRAINT PK_Employees
	PRIMARY KEY (EmployeeID);