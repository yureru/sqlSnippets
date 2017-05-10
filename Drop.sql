/* Usage of DROP statement
   With this you can drop all the major SQL Server objects (tables, views, sprocs, triggers, and so on.) */
-- SQL Server book, on page 164 onwards.

-- Drops two tables at the same time
-- Note that there's no option of "Are you sure?" to make the changes. They happen at the moment of executing query.
USE Accounting
DROP TABLE Customers, Employees

-- Drops the database
USE master
DROP DATABASE Accounting
