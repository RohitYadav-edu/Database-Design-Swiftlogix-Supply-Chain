# Question 1

USE swiftlogix_supply_chain;

-- 1. Departments
SELECT *
FROM Departments
ORDER BY departmentID;

-- 2. Categories
SELECT *
FROM Categories
ORDER BY categoryID;

-- 3. Products
SELECT *
FROM Products
ORDER BY productID;

-- 4. Customers
SELECT *
FROM Customers
ORDER BY customerID;

-- 5. Orders
SELECT *
FROM Orders
ORDER BY orderID;

-- 6. Order_items
SELECT *
FROM Order_items
ORDER BY orderItemID;
