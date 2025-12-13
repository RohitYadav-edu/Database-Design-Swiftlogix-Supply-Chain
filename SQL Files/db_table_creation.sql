CREATE DATABASE swiftlogix_supply_chain;

USE swiftlogix_supply_chain;

# Departments Table
CREATE TABLE Departments (
    departmentID     INT          PRIMARY KEY,
    department_name  VARCHAR(100) NOT NULL
);

# Categories Table
CREATE TABLE Categories (
    categoryID    INT           NOT NULL PRIMARY KEY,
    category_name VARCHAR(150),
    departmentID  INT,
    CONSTRAINT fk_categories_department
        FOREIGN KEY (departmentID)
        REFERENCES Departments(departmentID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);

# Products Table
CREATE TABLE Products (
    productID           BIGINT          NOT NULL PRIMARY KEY,
    product_name        VARCHAR(255)    NOT NULL,
    product_price       NUMERIC(12,2)   NOT NULL,
    product_status      VARCHAR(50)     NOT NULL,
    categoryID          INT             NOT NULL,
    product_description TEXT,

    CONSTRAINT fk_products_category
        FOREIGN KEY (categoryID)
        REFERENCES Categories(categoryID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);

# Customers Table
CREATE TABLE Customers (
    customerID       INT            NOT NULL PRIMARY KEY,
    customer_fname   VARCHAR(100)   NOT NULL,
    customer_lname   VARCHAR(100),
    customer_email   VARCHAR(255)   NOT NULL,
    customer_city    VARCHAR(150),
    customer_state   VARCHAR(100),
    customer_country VARCHAR(100)   NOT NULL,
    customer_zip     VARCHAR(20)    NOT NULL,
    market           VARCHAR(100),
    region           VARCHAR(100)
);

# Orders Table
CREATE TABLE Orders (
    orderID                 INT             NOT NULL PRIMARY KEY,
    order_date              DATETIME        NOT NULL,
    order_status            VARCHAR(50)     NOT NULL,
    order_city              VARCHAR(150),
    order_state             VARCHAR(100),
    order_country           VARCHAR(100)    NOT NULL,
    order_zip               VARCHAR(20)     NOT NULL,
    shipping_date           DATETIME        NOT NULL,
    shipping_mode           VARCHAR(50)     NOT NULL,
    delivery_status         VARCHAR(100)    NOT NULL,
    late_delivery_risk      SMALLINT        NOT NULL,
    shipping_days_real      INT             NOT NULL,
    shipping_days_scheduled INT             NOT NULL,
    benefit_per_order       NUMERIC(14,2)   NOT NULL,
    sales_per_customer      NUMERIC(14,2)   NOT NULL,
    order_profit_per_order  NUMERIC(14,2)   NOT NULL,
    customerID              INT             NOT NULL,

    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customerID)
        REFERENCES Customers(customerID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);

# Order_items Table
CREATE TABLE Order_items (
    orderItemID              INT             NOT NULL PRIMARY KEY,
    order_item_cardprod_id   INT             NOT NULL,
    item_quantity            INT             NOT NULL,
    item_product_price       NUMERIC(12,2)   NOT NULL,
    order_item_discount      NUMERIC(12,2),
    order_item_discount_rate NUMERIC(7,4),
    order_item_total         NUMERIC(14,2)   NOT NULL,
    sales                    NUMERIC(14,2)   NOT NULL,
    order_item_profit_ratio  NUMERIC(10,4),
    orderID                  INT             NOT NULL,
    productID                BIGINT          NOT NULL,
    product_card_id          VARCHAR(50)     NOT NULL,
    product_category_id      VARCHAR(50)     NOT NULL,

    CONSTRAINT fk_orderitems_order
        FOREIGN KEY (orderID)
        REFERENCES Orders(orderID)
        ON UPDATE RESTRICT
        ON DELETE CASCADE,

    CONSTRAINT fk_orderitems_product
        FOREIGN KEY (productID)
        REFERENCES Products(productID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);
