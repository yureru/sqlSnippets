/* Using JOIN statements to allow join tables */

-- Using the INNER JOIN, which allow us to join tables based on a condition
-- The resulting joined table can have the columns we want from either the two.
-- And it doesn't includes the records that didn't matched with the expression 
-- Customer.Customer_id = Customer_Order.Customer_id (that means they were orders for that customer).
-- Note that here we use an explicit choose in the Customer.Customer_id (think of this as like
-- an full qualified name from a namespace type like in C#). Though, it will not matter if we used
-- the Customer_order instead because are the same values.
SELECT ORDER_ID,
CUSTOMER.CUSTOMER_ID,
ORDER_DATE,
SHIP_DATE,
NAME,
STREET_ADDRESS,
CITY,
STATE,
ZIP,
PRODUCT_ID,
ORDER_QTY

FROM CUSTOMER INNER JOIN CUSTOMER_ORDER
ON CUSTOMER.CUSTOMER_ID = CUSTOMER_ORDER.CUSTOMER_ID;

-- But what if we do want to include the customers even if they don't have an order placed?
-- That's when we use an LEFT JOIN
-- Note that the customers that didn't had order placed they will show null on these Customer_order columns.
SELECT ORDER_ID,
CUSTOMER.CUSTOMER_ID,
ORDER_DATE,
SHIP_DATE,
NAME,
STREET_ADDRESS,
CITY,
STATE,
ZIP,
PRODUCT_ID,
ORDER_QTY

FROM CUSTOMER LEFT JOIN CUSTOMER_ORDER
ON CUSTOMER.CUSTOMER_ID = CUSTOMER_ORDER.CUSTOMER_ID;