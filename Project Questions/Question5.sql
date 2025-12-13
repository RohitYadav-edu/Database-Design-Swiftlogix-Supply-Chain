# Question 5

USE swiftlogix_supply_chain;

SELECT
    c.customerID,
    c.customer_fname,
    c.customer_lname,
    c.customer_country
FROM Customers AS c
WHERE c.customerID IN (
    SELECT o.customerID
    FROM Orders AS o
    GROUP BY o.customerID
    HAVING COUNT(*) > 5
)
ORDER BY c.customerID;
