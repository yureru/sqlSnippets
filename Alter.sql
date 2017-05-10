/* Usage of ALTER statement */
-- SQL Server book, on page 154 onwards.

/* Let's say you want to do a large import into your database, since you have Autogrow on the database
will grow automatically for the import. But it would grow in chunks (in this cases it will grow 16 times
at 5 MB each grow), causing an overhead. So if you know how much data are you going to import it's better
to grow the DB at the size you need. */

-- This expands the DB to 100 MB
ALTER DATABASE Accounting
	MODIFY FILE
	(Name = Accounting,
	 SIZE = 100 MB)


-- Adds a column into the DB
ALTER TABLE Employees
	ADD
		PreviousEmployer	varchar(30)	NULL

-- Adds several columns at the same time
ALTER TABLE Employees
	ADD
		DateOfBirth		date	NULL,
		LastRaiseDate	date	NOT NULL
			DEFAULT '2008-01-01'