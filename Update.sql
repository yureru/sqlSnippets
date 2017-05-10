/* Usage of the UPDATE statement */
-- User Northwind db.
UPDATE Stores
SET City = 'THERE'
WHERE StoreCode = 'TEST';

-- Obviously you can edit several columns in an UPDATE.
UPDATE Stores
Set City = 'There', State = 'NY'
WHERE StoreCode = 'TEST';

-- We can use an expression for the SET clause instead of the explicit values we have
-- provided so far.
UPDATE Stores
SET Name = Name + ' - ' + StoreCode;