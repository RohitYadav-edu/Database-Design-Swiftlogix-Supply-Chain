# Question 6

USE swiftlogix_supply_chain;

SELECT
    d.departmentID,
    d.department_name,
    c.categoryID,
    c.category_name,
    SUM(oi.sales)              AS total_sales,
    SUM(oi.order_item_total)   AS total_item_amount,
    AVG(oi.order_item_profit_ratio) AS avg_profit_ratio
FROM Departments AS d
JOIN Categories AS c  ON c.departmentID = d.departmentID
JOIN Products   AS p  ON p.categoryID   = c.categoryID
JOIN Order_items AS oi ON oi.productID  = p.productID
GROUP BY
    d.departmentID,
    d.department_name,
    c.categoryID,
    c.category_name
ORDER BY
    d.departmentID,
    c.categoryID;
