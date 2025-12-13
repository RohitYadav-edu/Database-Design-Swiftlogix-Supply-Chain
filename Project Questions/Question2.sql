# Question 2

USE swiftlogix_supply_chain;

SELECT 
    oi.orderItemID,
    oi.orderID,
    o.order_date,
    oi.productID,
    p.product_name,
    oi.item_quantity,
    oi.sales
FROM Order_items AS oi
INNER JOIN Orders   AS o ON oi.orderID  = o.orderID
INNER JOIN Products AS p ON oi.productID = p.productID
ORDER BY oi.orderItemID;
