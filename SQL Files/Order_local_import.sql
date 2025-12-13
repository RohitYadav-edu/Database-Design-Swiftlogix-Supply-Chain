# Importing the Orders CSV file (Import wizard failing)

LOAD DATA LOCAL INFILE '/Users/rohityadav/Desktop/Assignments/Sem 3/Database Design and Prototyping/Project/Dataset/csv Files/Orders.csv'
INTO TABLE Orders
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(orderID,
 order_date,
 order_status,
 order_city,
 order_state,
 order_country,
 order_zip,
 shipping_date,
 shipping_mode,
 delivery_status,
 late_delivery_risk,
 shipping_days_real,
 shipping_days_scheduled,
 benefit_per_order,
 sales_per_customer,
 order_profit_per_order,
 customerID);
