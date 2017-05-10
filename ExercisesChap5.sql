/* Exercises from Chapter 5. */

-- Creates a database with the size and filegrowth specified.
-- Note that when using this syntax, providing the filenames are required.
-- I've noticed that if you user this query on a DB that is master, the DB doesn't appears in the list
-- even after refreshing. You need to disconnect to see it. So it's better to use the master DB to execute this query.
CREATE DATABASE MyDB
ON
	(NAME = 'MyDB',
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL11.SERVERTWELVE\MSSQL\DATA\MyDBData.mdf',
	SIZE = 17MB,
	FILEGROWTH = 5MB)
	LOG ON
		(Name = 'MyDBLog',
		FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL11.SERVERTWELVE\MSSQL\DATA\MyDBLog.mdf',
		SIZE = 5MB,
		FILEGROWTH = 5MB);

	GO

-- Third exercise, we could use the MAX keyword, but the exercise is ambiguous.
USE MyDB
CREATE TABLE Foo
(
	Col1	varchar(50)	NOT NULL
)