/* Usage of Foreign Keys */
-- Page 183 onwards.

-- Our approach (it wasn't part of an exercise, but we decided to create
-- a foreign key.)
USE Accounting
CREATE TABLE Orders
(
	OrderID			int		IDENTITY	NOT NULL
		PRIMARY KEY,
	ItemID			int 	NOT NULL
		FOREIGN KEY
);

-- Actual table creation
USE Accounting
CREATE TABLE Orders
(
	OrderID		int 	IDENTITY	NOT NULL
		PRIMARY KEY,
	CustomerNo	int 				NOT NULL
		FOREIGN KEY REFERENCES Customers(CustomerNo),
	OrderDate	date 				NOT NULL,
	EmployeeID	int 				NOT NULL
);

-- Our approach to have an UNIQUE Foreign Key (see page: 185)
USE ACCOUNTING
ALTER TABLE Orders
	ADD CONSTRAINT FK_EemployeeID
	UNIQUE FOREIGN KEY (Employee.EmployeeID);

-- Actual approach to add another foreign key that references a column in another table
ALTER TABLE Orders
	ADD CONSTRAINT FK_EmployeeCreatesOrder
	FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID);

-- Before creating a FK that references the table itself, we need to have at least one record.
-- Check page 186 from the SQL Server book.

INSERT INTO Employees
	(
	FirstName,
	LastName,
	Title,
	SSN,
	Salary,
	PriorSalary,
	HireDate,
	ManagerEmpID,
	Department
	)
VALUES
	(
	'Billy Bob',
	'Boson',
	'Head Cook & Bottle Washer',
	'123-45-6789',
	100000,
	80000,
	'1990-01-01',
	1,
	'Cooking and Bottling'
	);

-- Now that we have a primer row, you can add the foreign key. In an ALTER situation, this works
-- just the same as any other foreign key definition. You can now try this out:
-- NOTE: We've tried running this snippet several times, and we always got an error. It was due we had selected the master database instead
-- the Accounting, funny thing is that we could run a "Select All" in Accounting (with master being the db selected in the MSSMS.)
-- So that's why we always need to use the USE DATABASE statement before runing any query.
ALTER TABLE Employees
	ADD CONSTRAINT FK_EmployeeHasManager
	FOREIGN KEY (ManagerEmpID) REFERENCES Employees(EmployeeID);

-- We can leave the FOREIGN KEY when creating a FK that references itself at the moment
-- of creating the table. Pay attention to the foreign key on the ManagerEmpID column.
-- Page 188 from the SQL Book describes a note about this, basically: "schema-bound" that doesn't allows you to drop this table,
-- and a self-referencing tip to avoid having a primer row.
CREATE TABLE Employees (
	EmployeeID 			int 		IDENTITY	NOT NULL
		PRIMARY KEY,
	FirstName			varchar(25)				NOT NULL,
	MiddleInitial		char(1)					NULL,
	LastName			varchar(25)				NOT NULL,
	Title				varchar(25)				NOT NULL,
	SSN					varchar(11)				NOT NULL,
	Salary 				money					NOT NULL,
	PriorSalary			money					NOT NULL,
	LastRaise AS Salary - PriorSalary,
	HireDate			smalldatetime			NOT NULL,
	TerminationDate		smalldatetime			NULL,
	ManagerEmpID		int 					NOT NULL
		REFERENCES Employees(EmployeeID),
	Department			varchar(25)				NOT NULL
);