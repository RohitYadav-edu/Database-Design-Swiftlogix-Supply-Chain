# Question 8

USE swiftlogix_supply_chain;

SELECT
    o.orderID,
    o.order_date,
    o.shipping_date,
    o.late_delivery_risk,
    CASE
        WHEN o.late_delivery_risk = 1 THEN 'Late delivery'
        ELSE 'On time / on-schedule'
    END AS delivery_status_flag
FROM Orders AS o
ORDER BY o.orderID;
