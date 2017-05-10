/* Using FULL JOIN statements to allow join both tables in each side */

-- Joins three tables and returns the specified columns
SELECT a.Address, va.AddressID, v.VendorID, v.VendorName
FROM VendorAddress va
FULL JOIN Address a
	ON va.AddressID = a.AddressID
FULL JOIN Vendors v
	ON va.VendorID = v.VendorID;