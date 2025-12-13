# Question 10

USE swiftlogix_supply_chain;

SELECT
    o.orderID,
    o.order_date,
    o.customerID,
    o.benefit_per_order,
    o.order_profit_per_order
FROM Orders AS o
WHERE o.orderID IN (
    SELECT DISTINCT oi.orderID
    FROM Order_items AS oi
    WHERE oi.order_item_discount IS NOT NULL
)
ORDER BY o.orderID;
