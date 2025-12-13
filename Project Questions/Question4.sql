# Question 4

USE swiftlogix_supply_chain;

SELECT
    o.orderID,
    o.order_date,
    o.benefit_per_order,
    o.order_profit_per_order,
    o.customerID
FROM Orders AS o
WHERE o.benefit_per_order = (
    SELECT MAX(benefit_per_order)
    FROM Orders
)
ORDER BY o.orderID;
