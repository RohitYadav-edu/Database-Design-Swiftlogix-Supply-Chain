CREATE DEFINER=`root`@`localhost` FUNCTION `fn_net_item_value`(
	p_qty INT,
    p_price DECIMAL(12,2),
    p_discount DECIMAL(12,2)
) RETURNS decimal(14,2)
    DETERMINISTIC
BEGIN
	RETURN ROUND(((p_qty * p_price)- IFNULL(p_discount,0)),2);
END