# Question 9

USE swiftlogix_supply_chain;

SELECT
    p.productID,
    p.product_name,
    p.product_status,
    p.categoryID
FROM Products AS p
WHERE NOT EXISTS (
    SELECT 1
    FROM Order_items AS oi
    WHERE oi.productID = p.productID
)
ORDER BY p.productID;
