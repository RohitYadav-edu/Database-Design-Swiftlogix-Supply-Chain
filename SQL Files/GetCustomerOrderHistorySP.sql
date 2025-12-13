CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCustomerOrderHistory`(
	IN p_customerID INT
)
BEGIN
 
 /* Customer order history:
 orders (1) --> order_items (many) --> products (many)
 aggregate per orderID so that none of the order repeats. */
 
 -- min(customerID) = 1 and max(customerID) = 20757
 
 SELECT
	o.customerID,
    o.orderID,
    o.order_date,
    o.order_status,
    o.shipping_mode,
    o.delivery_status,
    o.late_delivery_risk,
    COUNT(oi.orderItemID) AS line_items,
    SUM(oi.item_quantity) AS total_quantity,
    ROUND(SUM(oi.sales),2) AS total_sales,
    ROUND(SUM(IFNULL(oi.order_item_discount,0)),2) AS total_discount,
    ROUND(SUM(oi.sales) - SUM(IFNULL(oi.order_item_discount,0))) AS net_sales,
    ROUND(SUM(oi.order_item_total),2) AS total_item_total,
    ROUND(SUM(IFNULL(oi.order_item_profit_ratio,0)),4) AS sum_profit_ratio,
    ROUND(o.benefit_per_order, 2) AS benefit_per_order,
    ROUND(o.order_profit_per_order, 2) AS order_profit_per_order
FROM Orders o
INNER JOIN Order_items oi ON o.orderID = oi.orderID
INNER JOIN Products p ON p.productID = oi.productID
WHERE o.customerID = p_customerID

GROUP BY 
	o.customerID, o.orderID, o.order_date, o.order_status, o.benefit_per_order,
    o.shipping_mode, o.delivery_status, o.late_delivery_risk, o.order_profit_per_order

ORDER BY o.order_date DESC, o.orderID DESC;
END