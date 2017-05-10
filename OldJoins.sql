/* Demonstration of old JOINs: INNER JOINs, OUTER JOINs that aren't ANSI compliant
   but that in previous SQL versions are used.
   Apparently this shouldn't work in versions equal and greater than SQL Server 2012,
   but in our case they work in the 2012 version. */

-- This is how we normally do an INNER JOIN
SELECT *
FROM Person.Person
JOIN HumanResources.Employee
	ON Person.Person.BusinessEntityID =
	HumanResources.Employee.BusinessEntityID;

-- This is equivalent as the precedent query, here the INNER JOIN (or only JOIN) is replaced
-- by the comma operator, and the ON keyword is replaced by the WHERE. They work exactly the same.
SELECT *
FROM Person.Person, HumanResources.Employee
WHERE Person.Person.BusinessEntityID =
	HumanResources.Employee.BusinessEntityID;


-- This is how we normally do OUTER JOINs
SELECT sso.SpecialOfferId, Description, DiscountPct, ProductID
FROM Sales.SpecialOffer sso
LEFT JOIN Sales.SpecialOfferProduct ssop
	ON sso.SpecialOfferID = ssop.SpecialOfferID
WHERE sso.SpecialOfferID != 1;

-- This is equivalent and it doesn't works on SQL Server 2012 (we checked this, and it actually doesn't
-- works.)
-- The example is showed because there's still code like this existing around.
-- It replaces the LEFT OR RIGHT JOIN with the coma, the ON with the WHERE and to specify a LEFT JOIN
-- or a RIGHT JOIN it uses the *= or =* operator respectively.
SELECT sso.SpecialOfferID, Description, DiscountPct, ProductID
FROM Sales.SpecialOffer sso,
	Sales.SpecialOfferProduct ssop
WHERE sso.SpecialOfferID *= ssop.SpecialOfferID
	AND sso.SpecialOfferID != 1;


-- This is how we normally do a CROSS JOIN
SELECT v.VendorName, a.Address
FROM Vendors v
CROSS JOIN Address a;

-- To specify a CROSS JOIN in the non ANSI form, we just do "nothing", that is, we 
-- only change the CROSS JOIN keyword for a comma and we get the cross join.
SELECT v.VendorName, a.Address
FROM Vendors v, Address a;