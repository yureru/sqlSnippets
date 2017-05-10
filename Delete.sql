/* Usage of the DELETE statement */
-- Use Northwind db.

-- Deletes a row.
/* Note that you need to delete the record it is referencing before
 * this deletion, or otherwise you will get an error
 */
DELETE Stores
WHERE StoreCode = 'TEST';

-- So you must use this first, delete the record in order to execute the
-- previous statement.
DELETE Sales
WHERE StoreCode = 'TEST';
-- Now execute the previous statement.

