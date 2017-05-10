/* Scripts to create a DB, from page 139 onwards. */

-- Creates a DB specifying the location and filename, even for the log file.
CREATE DATABASE Accounting
ON
	(NAME = 'Accounting',
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL11.SERVERTWELVE\MSSQL\DATA\AccountingData.mdf',
	SIZE = 10,
	MAXSIZE = 50,
	FILEGROWTH = 5)
	LOG ON
		(Name = 'AccountingLog',
		FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL11.SERVERTWELVE\MSSQL\DATA\AccountingLog.ldf',
		SIZE = 5MB,
		MAXSIZE = 25MB,
		FILEGROWTH = 5MB);

	GO

-- Creates a table
USE Accounting
CREATE TABLE Customers
(
	CustomerNo		int			IDENTITY NOT NULL,
	CustomerName	varchar(30)	NOT NULL,
	Address1		varchar(30)	NOT NULL,
	Address2		varchar(30)	NOT NULL,
	City			varchar(20)	NOT NULL,
	State			char(2)		NOT NULL,
	ZIP				varchar(10)	NOT NULL,
	Contact			varchar(25)	NOT NULL,
	Phone			char(15)	NOT NULL,
	FedIDNo			varchar(9)	NOT NULL,
	DateInSystem	date		NOT NULL
)

-- Once you've created the table, you need to make sure it was created successfully
-- and with the data you specified.
EXEC sp_help Customers;

-- Trying to create a table based on the requeriments in page 152
USE Accounting
CREATE TABLE Employees
(
	EmployeeID		int 		IDENTITY NOT NULL,
	FirstName		varchar(20)	NOT NULL,
	MiddleInitial	varchar(1)	NULL,
	LastName		varchar(20)	NOT NULL,
	Title			varchar(20)	NOT NULL,
	SSN				varchar(10)	NOT NULL,
	Salary			decimal		NOT NULL,
	PrevSalary		decimal		NOT NULL,
	AmtLastRaise	decimal		NOT NULL,
	DateOfHire		date 		NOT NULL,
	DateOfEnd		date 		NOT NULL,
	Manager			int 		NOT NULL,
	Department		int 		NOT NULL
)

-- Book's example of previous exercise
USE Accounting
CREATE TABLE Employees
(
	EmployeeID		int 		IDENTITY NOT NULL,
	FirstName		varchar(25)	NOT NULL,
	MiddleInitial	char(1)		NULL,
	LastName		varchar(25)	NOT NULL,
	Title			varchar(25)	NOT NULL,
	SSN				varchar(11)	NOT NULL,
	Salary			money		NOT NULL,
	PriorSalary		money		NOT NULL,
	LastRaise AS Salary - PriorSalary,
	HireDate		date 		NOT NULL,
	TerminationDate	date 		NULL,
	ManagerEmpID	int 		NOT NULL,
	Department		varchar(25)	NOT NULL
)