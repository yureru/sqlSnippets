/* Using OUTER JOIN statements to allow join tables */

/* This tries to get all the "special offers", the description, discount percent, and the product
id which is applyed, leaving out the normal price (SpecialOfferID != 1).
   Note that this doesn't gets "all the special offers" since the where leave out the null values,
   and that doesn't shows the special offers that are currently being unused.
   So we must use an OUTER JOIN, (this snippet is disponible in InnerJoin.sql file too.)
 */
SELECT sso.SpecialOfferID, Description, DiscountPct, ProductID
FROM Sales.SpecialOffer sso
JOIN Sales.SpecialOfferProduct ssop
	ON sso.SpecialOfferID = ssop.SpecialOfferID
WHERE sso.SpecialOfferID != 1;

-- In order to return every special offer and the products where applicable, you need to change only the
-- JOIN type in the query:
SELECT sso.SpecialOfferID, Description, DiscountPct, ProductID
FROM Sales.SpecialOffer sso
LEFT JOIN Sales.SpecialOfferProduct ssop
	ON sso.SpecialOfferID = ssop.SpecialOfferID
WHERE sso.SpecialOfferID != 1;

-- What will happen if you change the OUTER JOIN type and the position of the tables?
-- As you can see, the result is the same as the precedent query.
SELECT sso.SpecialOfferID, Description, DiscountPct, ProductID
FROM Sales.SpecialOfferProduct ssop
RIGHT JOIN Sales.SpecialOffer sso
	ON ssop.SpecialOfferID = sso.SpecialOfferID
WHERE sso.SpecialOfferID != 1;

/* The author asked to find Oprhan or Non-Matching records, that meaning:
Get the special offer names for all the special offers that are not associated with any products.
 */
-- This iswith what we've come up, in thsi version we don't use the alias.
-- And after reading the requirement, we also don't fulfill the "for all the special offers" requirement.
SELECT Description
FROM Sales.SpecialOffer
LEFT JOIN Sales.SpecialOfferProduct
	ON Sales.SpecialOfferProduct.SpecialOfferID = Sales.SpecialOffer.SpecialOfferID
WHERE Sales.SpecialOfferProduct.ProductID IS NULL;

-- Equivalent as before, but now using alias.
SELECT Description
FROM Sales.SpecialOffer sso
LEFT JOIN Sales.SpecialOfferProduct ssop
	ON sso.SpecialOfferID = ssop.SpecialOfferID
WHERE ssop.ProductID IS NULL;

-- The book's query
SELECT Description
FROM Sales.SpecialOfferProduct ssop
RIGHT OUTER JOIN Sales.SpecialOffer sso
	ON ssop.SpecialOfferID = sso.SpecialOfferID
WHERE sso.SpecialOfferID != 1
	AND ssop.SpecialOfferID IS NULL;

-- USE Chapter4DB
SELECT v.VendorName, va.VendorID
FROM Vendors v
LEFT JOIN VendorAddress va
	ON v.VendorID = va.VendorID;

-- We want to return the vendor name and the address of that vendor, which are sparsed
-- between the tables: Address, VendorAddress, and Vendors.

-- the next query tries to achieve that, but because of the JOIN nature it doesn't incldues null values.
SELECT v.VendorName, a.Address
FROM Vendors v
LEFT JOIN VendorAddress va
	ON v.VendorID = va.VendorID
JOIN Address a
	ON va.AddressID = a.AddressID;

-- We can try different solutions to return all the vendor names even if they don't have an address.
-- Note that the logic in this query is a bit different; if there were rows in VendorAddress that didn't
-- have matching rows in Address, the query earleir query used to exclude those (with its INNER JOIN syntax),
-- and now they're permitted.
SELECT v.Vendorname, a.Address
FROM Vendors v
LEFT JOIN VendorAddress va
	ON v.VendorID = va.VendorID
LEFT JOIN Address a
	ON va.AddressID = a.AddressID;

-- This is what we want, has the correct logic and doesn't changes it.
SELECT v.VendorName, a.Address
FROM VendorAddress va
JOIN Address a
	ON va.AddressID = a.AddressID
RIGHT JOIN Vendors v
	ON v.vendorID = va.VendorID;

-- Same as before, but grouping JOINs together.
-- Parentheses are optional.
SELECT v.VendorName, a.Address
FROM Vendors v
LEFT JOIN (
VendorAddress va
JOIN Address a
	ON va.AddressID = a.AddressID
)
ON v.VendorID = va.VendorID;