/* This next statement is going to use code to
 * change the "current" database to AdventureWorks.
 * This makes certain, right in the code, that you are going 
 * to the correct database.
 */

USE AdventureWorks;

/* This next statement declares your working table.
 * This particular table is actually a variable you are declaring
 * on the fly.
 */

DECLARE @MyTable Table
(
	SalesOrderID	int,
	CustomerID		char(5)
);

/* Now that you have your table variable, you're ready
 * to populate it with data from your SELECT statement.
 * Note that you could just as easily insert the
 * data into a permanent table (instead of a table variable).
 **/
INSERT INTO @MyTable
	SELECT SalesOrderID, CustomerID
	FROM AdventureWorks.Sales.SalesOrderHeader
	WHERE SalesOrderID BETWEEN 44000 AND 44010;

-- Finally, make sure that the data was inserted like you think
SELECT * FROM @MyTable;

-- About the MyTable variable.
/* Note that if you try running a SELECT against @MyTable by itself (that is, outside
 * this script), you're going to get an error. @MyTable is a declared variable, and it
 * exists only as long as it remains in scope within the running batch. After that,
 * it is automatically destroyed.
 * It's also worth noting that you could have used what's called a temporary table.
 * This is similar in nature, but it doesn't work in quite the same way. You'll
 * discover a lot more about temp tables and table variables in Chapters 11 through 13.
 */

	