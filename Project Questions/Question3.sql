# Question 3

USE swiftlogix_supply_chain;

SELECT
    c.customerID,
    c.customer_fname,
    c.customer_lname,
    o.orderID,
    o.order_date
FROM Customers AS c
LEFT OUTER JOIN Orders AS o
    ON c.customerID = o.customerID
ORDER BY c.customerID, o.orderID;
