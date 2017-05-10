/* Use of Inner Joins
Used with the AdventureWorks DB */

-- Joins two tables based on a field.
/* By runnign this query, you can notice several things:
   - The BusinessEntityID column appears twice, but there's nothing to say which one is from which table.
   - All columns were returned from both tables.
   - The first columns listed were from the first table listed.
    */
SELECT * FROM Person.Person
INNER JOIN HumanResources.Employee
	ON Person.Person.BusinessEntityID =
	HumanResources.Employee.BusinessEntityID;

-- Since using * is kinda frown upon, only return the columns that you really need to improve performance.
/* If you wanted all of the base information for a concat, but only needed the Employee table to figure
   out the concat's JobTitle, you could have changed your query to read: */
SELECT Person.BusinessEntity.*, JobTitle
FROM Person.BusinessEntityID
INNER JOIN HumanResources.Employee
	ON Person.BusinessEntity.BusinessEntityID =
	HumanResources.Employee.BusinessEntityID;

-- Note that if we run the following query, we will get the error: Ambiguous column name 'BusinessEntityID'.
-- This happens because that column exists in both tables, we need to specify the table
-- from where's that column name, pretty much like C#'s namespaces.
-- Besides specifying the full name, we can Alias the tables and the specify the alias for that column that is repeated in both tables to avoid ambiguity.
SELECT Person.BusinessEntity.*, BusinessEntityID
FROM Person.BusinessEntity
INNER JOIN HumanResources.Employee
	ON Person.BusinessEntity.BusinessEntityID =
	HumanResources.Employee.BusinessEntityID;

-- Same as the earleir query, but with the ambigous error solved.
SELECT Person.BusinessEntity.*, HumanResources.Employee.BusinessEntityID
FROM Person.BusinessEntity
INNER JOIN HumanResources.Employee
	ON Person.BusinessEntity.BusinessEntityID =
	HumanResources.Employee.BusinessEntityID;

-- Same as the earlier query, but with aliases to avoid the ambiguity error.
-- Note that we can (and should) use the AS keyword to determine an alias.
SELECT pbe.*, hre.BusinessEntityID
FROM Person.BusinessEntity pbe
INNER JOIN HumanResources.Employee hre
	ON pbe.BusinessEntityID = hre.BusinessEntityID;

/* Note that using an alias is an all-or-nothing proposition. Once we decide to use an alias for a table
   we need to use that alais for every part of the query.
   The following query doesn't goes with this premise so we get the error:
   The multi-part identifier "HumanResources.Employee.BusinessEntityID" could not be bound.  */
SELECT pbe.*, HumanResources.Employee.BusinessEntityID
FROM Person.BusinessEntity pbe
INNER JOIN HumanResources.Employee hre
	ON pbe.BusinessEntityID = hre.BusinessEntityID;

-- By selecting explicitly which columns we want to return, we can also specify the order of the columns.
-- (The order they retrieved/ordered, not lexicographically ordered.)
SELECT pbe.BusinessEntityID, hre.JobTitle, pp.FirstName, pp.LastName
FROM Person.BusinessEntity pbe
INNER JOIN HumanResources.Employee hre
	ON pbe.BusinessEntityID = hre.BusinessEntityID
INNER JOIN Person.Person pp
	ON pbe.BusinessEntityId = pp.BusinessEntityID
WHERE hre.BusinessEntityID < 4;

-- The way we done the query asked in page 100
-- Note that the column names on the JOIN don't match, they aren't required to match on the column's name
-- in order to use the JOIN.
SELECT Person.Person.FirstName, Sales.Customer.AccountNumber
FROM Person.Person
INNER JOIN Sales.Customer
	ON Person.Person.BusinessEntityID =
	Sales.Customer.PersonID;

-- Way the book specified to make the earleir query:
-- Note that if we want to order it lexicographically, we must use the ORDER BY keyword.
-- NOTE also that here we're not using INNER JOIN, just JOIN, that's because JOIN is the INNER JOIN by default.
SELECT CAST(LastName + ', ' + FirstName AS varchar(35)) AS Name, AccountNumber
FROM Person.Person pp
JOIN Sales.Customer sc
	ON pp.BusinessEntityID = sc.PersonID;

/* This tries to get all the "special offers", the description, discount percent, and the product
id which is applyed, leaving out the normal price (SpecialOfferID != 1).
   Note that this doesn't gets "all the special offers" since the where leave out the null values,
   and that doesn't shows the special offers that are currently being unused.
   So we must use an OUTER JOIN, check the OuterJoin.sql file.
 */
SELECT sso.SpecialOfferID, Description, DiscountPct, ProductID
FROM Sales.SpecialOffer sso
JOIN Sales.SpecialOfferProduct ssop
	ON sso.SpecialOfferID = ssop.SpecialOfferID
WHERE sso.SpecialOfferID != 1;

-- Which records exists in Person that don't have a corresponding records in the Employee table?
-- Which in the opposite, is the same as: Whcih persons are not employees?
SELECT pp.BusinessEntityID, pp.FirstName, pp.LastName
FROM Person.Person pp
LEFT JOIN HumanResources.Employee hre
	ON pp.BusinessEntityID = hre.BusinessEntityID
WHERE hre.BusinessEntityID IS NULL;