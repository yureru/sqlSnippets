/* How to disable the checking for a constraint that is added to an existing table and that table itself
   has bad data. From page 202 onwrads of SQL Server book.
   Remember that you can't add a constraint for a column that doesn't meets the data constraint requirement.
   For example: If you have a negative number for a Price column in some records, then you add a CHECK CONSTRAINT
   that doesn't allows negative values for that column, you're gonna get an error saying this is not allowed.
   */

/* Note: We got a weird bug by the GETDATE constraint at Accounting.Customers.DateInSystem. Basically we couldn't do insertions in this
table due DateInSystem constraint. I think this happened because we "sleep"  the laptop and for some reason makes this constraint fail.
Even using a print getdate() in a query haves us good results, but couldn't insert the record anyway.
To fix this we copy the result from print getdate() and pasted it into the insert query for the DateInSystem column.
After that, we could insert new records normally by using the GETDATE() function.
Apparently this happens because getdate function gets the date and time down to milliseconds, so you never now when the insertion to the
database is going to happen, therefore at the check of getdate is made at the insertion, the date and time is bigger.
*/

-- Creates a record to insert in Customers
INSERT INTO Customers
	(
	CustomerName,
	Address1,
	Address2,
	City,
	State,
	Zip,
	Contact,
	Phone,
	FedIDNo,
	DateInSystem)
VALUES
	(
	'MyCust',
	'123 Anywhere',
	'',
	'Reno',
	'NV',
	80808,
	'Joe Bob',
	'555-1212',
	'931234567',
	GETDATE());

-- Add a constraint for the Phone column (we know that we have bad data)
-- Message we get after running it:
-- The ALTER TABLE statement conflicted with the CHECK constraint "CN_CustomerPhoneNo". The conflict occurred in database "Accounting", table "dbo.Customers", column 'Phone'.
ALTER TABLE Customers
	ADD CONSTRAINT CN_CustomerPhoneNo
	CHECK
	(Phone LIKE '([0-9][0-9][0-9]) [0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]');

/* SQL Server doesn't allows to make the constraint because we have already data that
doesn't fulfills the constraint requirement. To get around this and install the constraint, you need
to correct the existing data or you must use of the WITH NOCHECK option in the ALTER statement.
Just as the following query.  */
ALTER TABLE Customers
	WITH NOCHECK
	ADD CONSTRAINT CN_CustomerPhoneNo
	CHECK
	(Phone LIKE '([0-9][0-9][0-9]) [0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]');

-- If we try to insert the same query as earlier, we will get a rejection since the
-- phone column doesn't matchs the constraint
INSERT INTO Customers
	(
	CustomerName,
	Address1,
	Address2,
	City,
	State,
	Zip,
	Contact,
	Phone,
	FedIDNo,
	DateInSystem)
VALUES
	(
	'MyCust',
	'123 Anywhere',
	'',
	'Reno',
	'NV',
	80808,
	'Joe Bob',
	'555-1212',
	'931234567',
	GETDATE());

-- However, if we modify the INSERT statement to adhere to the constraint and then
-- re-execute it, the row will be inserted normally:
INSERT INTO Customers
	(
	CustomerName,
	Address1,
	Address2,
	City,
	State,
	Zip,
	Contact,
	Phone,
	FedIDNo,
	DateInSystem)
VALUES
	(
	'MyCust',
	'123 Anywhere',
	'',
	'Reno',
	'NV',
	80808,
	'Joe Bob',
	'(800) 555-1212',
	'931234567',
	GETDATE());

-- Do a query to return the records in Customers table.
-- Note that old data is retained for back reference,
-- but any new data is restricted to meeting the new criteria.

-----------------------------------------------------------------------------------------------------------

-- Now how to disable temporally a constraint. From page 204 onwards.

-- Instead of deleting a constraint, entering bad data, and then creating again the
-- constraint, you can temporally disable the constraint.
-- Disables temporally the constraint you created earlier.
ALTER TABLE Customers
	NOCHECK
	CONSTRAINT CN_CustomerPhoneNo;

-- Now we can add data that not neccessarilly meets the PhoneNo constraint, because now is disabled.
INSERT INTO Customers
	(
	CustomerName,
	Address1,
	Address2,
	City,
	State,
	Zip,
	Contact,
	Phone,
	FedIDNo,
	DateInSystem
	)
VALUES
	(
	'Jeff',
	'Lane Street',
	'',
	'Manchester',
	'MC',
	'482331',
	'Jeff Lynne',
	'999-32123',
	'987123',
	'Jan 30 2017  2:05PM'
	);

-- You can check which constraints are currently enabled/disabled by executing the
-- command sp_helpconstraint and looking at the status_enabled column in the result.
sp_helpconstraint Customers;

-- When we're aready to set again the constraint, we use the same command but instead
-- the NOCHECK we will use a CHECK.
ALTER TABLE Customers
	CHECK
	CONSTRAINT CN_CustomerPhoneNo;

-- If we run the earlier insert again, we will get an error for CN_CustomerPhoneNo constraint.