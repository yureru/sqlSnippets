/* Usage of UNIONs.
   JOINs pastes data horizontally (that is, columns) whereas UNION joins data vertically, that is tables.
    */
    -- Use AdventureWorks db.
-- Page 121 onwards

-- Joins to tables vertically by using the UNION.
-- Note that the columns names are used from the first query, so the table resulting will have two columns, named: Name and EmailAddress.
-- Also, UNION works in a DISTINCT basis, so it throws repeated records by default. You can override this by using the ALL keyword.
SELECT FirstName + ' ' + LastName AS Name,
	pe.EmailAddress EmailAddress
FROM Person.Person pp
JOIN Person.EmailAddress pe
	ON pp.BusinessEntityID = pe.BusinessEntityID
JOIN Sales.Customer sc
	ON pp.BusinessEntityID = sc.CustomerID
 
 UNION

SELECT FirstName + ' ' + LastName AS VendorName,
	pe.EmailAddress VendorEmailAddress
FROM Person.Person pp
JOIN Person.EmailAddress pe
	ON pp.BusinessEntityID = pe.BusinessEntityID
JOIN Purchasing.Vendor pv
	ON pp.BusinessEntityID = pv.BusinessEntityID;

-- Gets a list of products that either have fewer than 100 units in stock, or are on a
-- special promotion right now.
SELECT P.ProductNumber
FROM Production.Product P
JOIN Production.ProductInventory I
	ON I.ProductID = P.ProductID
WHERE I.Quantity < 100
UNION
SELECT P.ProductNumber
FROM Production.Product P
JOIN Sales.SpecialOfferProduct O
	ON P.ProductID = O.ProductID
WHERE O.SpecialOfferID > 1;

-- This query returns the distinc products from the first query, then the others are
-- distinct products/combinations (including Less than 100 left as an offer)
SELECT P.ProductNumber, 'Less than 100 left' AS SpecialOffer
FROM Production.Product P
JOIN Production.ProductInventory I
	ON I.ProductID = P.ProductID
WHERE I.Quantity < 100
UNION
SELECT P.ProductNumber, SO.Description
FROM Production.Product P
JOIN Sales.SpecialOfferProduct O
	ON P.ProductID = O.ProductID
JOIN Sales.SpecialOffer SO
	ON SO.SpecialOfferID = O.SpecialOfferID
WHERE O.SpecialOfferID > 1;

-- Note that this isn't the same as the precedent, because UNION ALL includes all the records, even those duplicates.
SELECT P.ProductNumber, 'Less than 100 left' AS SpecialOffer
FROM Production.Product P
JOIN Production.ProductInventory I
	ON I.ProductID = P.ProductID
WHERE I.Quantity < 100
UNION ALL
SELECT P.ProductNumber, SO.Description
FROM Production.Product P
JOIN Sales.SpecialOfferProduct O
	ON P.ProductID = O.ProductID
JOIN Sales.SpecialOffer SO
	ON SO.SpecialOfferID = O.SpecialOfferID
WHERE SO.SpecialOfferID > 1;