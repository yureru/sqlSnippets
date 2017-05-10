/* Several commands that we have used. */

/* Check this command in the chapter 4 of the book Beginning SQL Server */
-- sp_help

/* Provides the database structure information, like sizes, where's the files, name, etc. */
EXEC sp_helpdb 'Accounting'

EXEC sp_help Accounting

-- Checks what connections are open (apparently you can do this with MSSMS)
EXEC sp_who

-- Gets the names, criteria, and status for all the constraints on the table.
-- It has the form of EXEC COMMAND TABLENAME
EXEC sp_helpconstraint Orders