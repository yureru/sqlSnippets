/* Usage of Rules. Page 206 onwards from SQL Server book.
   They're very similar to check constraints but aren't ansi compliant, and are deprecated and legacy.
*/

-- Creates a rule
-- Note that what you are comparing is shown as a variable. Whatever the value is of the column
-- being checked, that is the value that will be used in the place of @Salary.
CREATE RULE SalaryRule
	AS @Salary > 0;

-- Command to see what the rule looks like.
EXEC sp_helptext SalaryRule;

-- Creating the rule isn't enough to use it. To activate the rule, we need to make use of a special
-- stored procedure called sp_bindrule. You want to bind your SalaryRule to the Salary column of your
-- Employees table. The syntax looks like this (see page 207.)
-- Note that you need to specify the tablename.column.
EXEC sp_bindrule 'SalaryRule', 'Employees.Salary';

-- Now try to insert or update a record with a negative value for the Salary. You should get an error.
UPDATE Employees
	SET Salary = -80000
	WHERE EmployeeID = 1;
-- The error we get is:
-- A column insert or update conflicts with a rule imposed by a previous CREATE RULE statement.
-- The statement was terminated. The conflict occurred in database 'Accounting', table 'dbo.Employees', column 'Salary'.


-- Now what if you want to remove the rule from the column? Use the following command
EXEC sp_unbindrule 'Employees.Salary';

-- Dropping rules. If you want to completely eliminate a rule from your database, you use the following command:
DROP RULE <rule name>

-- Example:
DROP RULE SalaryRule;