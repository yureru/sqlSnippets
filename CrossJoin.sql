/* Using CROSS JOIN */

/* This joins all the records on both sides of the JOIN, and produces a Cartesian product of all the records
on both sides of the JOIN. So basically in this case we end up with a 3 * 5 = 15 records as result. */

SELECT v.VendorName, a.Address
FROM Vendors v
CROSS JOIN Address a;