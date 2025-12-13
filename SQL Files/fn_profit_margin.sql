CREATE DEFINER=`root`@`localhost` FUNCTION `fn_profit_margin`(
	p_profit DECIMAL(14,2),
    p_sales DECIMAL(14,2)
) RETURNS decimal(14,2)
    DETERMINISTIC
BEGIN
	IF p_sales IS NULL or p_sales = 0 THEN
		RETURN NULL;
	END IF;
	RETURN ROUND((p_profit/p_sales) * 100, 2);
END