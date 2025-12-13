CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMonthlySalesSummary`(
	IN p_year INT,
    IN p_month INT
)
BEGIN
	-- Overall Monthly Summary
    SELECT 
		p_year AS year,
		p_month AS month,
        COUNT(DISTINCT o.orderID) AS total_orders,
        COUNT(DISTINCT o.customerID) AS total_customers,
        SUM(o.benifit_per_order) AS total_benifit,
        SUM(o.order_profit_per_order) AS total_profit,
        SUM(CASE WHEN o.late_delivery_risk = 1 THEN 1 ELSE 0 END) AS late_orders,
        ROUND(AVG(o.shipping_days_real),2) AS avg_shipping_days_real,
        ROUND(AVG(o.shipping_days_scheduled),2) AS avg_shipping_days_scheduled
	FROM Orders o
    WHERE 
		YEAR(o.order_date) = p_year AND
        MONTH(o.order_date) = p_month;
        
    -- Breakdown by shipping mode
    SELECT 
		p_year AS year,
		p_month AS month,
        COUNT(DISTINCT o.orderID) AS total_orders,
        COUNT(DISTINCT o.customerID) AS total_customers,
        SUM(o.benifit_per_order) AS total_benifit,
        SUM(o.order_profit_per_order) AS total_profit,
        SUM(CASE WHEN o.late_delivery_risk = 1 THEN 1 ELSE 0 END) AS late_orders
	FROM Orders o
    WHERE 
		YEAR(o.order_date) = p_year AND
        MONTH(o.order_date) = p_month
	GROUP BY shipping_mode
    ORDER BY orders_count DESC;
END