/* Exercises from chapter 4 */

/* Write a query against the AdventureWorks database that returns one column called
   Name and contains the last name of the employee with NationalIDNumber 112457891. */
SELECT LastName AS Name
FROM HumanResources.Employee E
JOIN Person.Person P
	ON E.BusinessEntityID = P.BusinessEntityID
WHERE E.NationalIDNumber = '112457891';

/* Write a query against the AdventureWorks database that returns all products
   (ID and Name) and including both all products that have no special offers, and all
   products that have the No Discount offer.*/
SELECT P.ProductID, Name
FROM Production.Product P
	JOIN Sales.SpecialOfferProduct SOP
	ON P.ProductID = SOP.ProductID
	JOIN Sales.SpecialOffer SO
	ON SOP.SpecialOfferID = SO.SpecialOfferID
WHERE SOP.SpecialOfferID = 1
AND SO.Type = 'No Discount';