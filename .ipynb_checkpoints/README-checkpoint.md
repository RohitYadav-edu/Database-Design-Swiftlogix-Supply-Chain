# SwiftLogix Supply Chain Database Design & Analysis

---

## Overview
This project focuses on designing and implementing a relational database to model real-world supply chain and logistics operations. The goal is to transform a large, unstructured dataset into a well-organized database that supports meaningful analysis of orders, products, customers, and logistics performance.

The project follows an end-to-end data workflow — starting from raw data extraction and cleaning, moving through conceptual and physical data modeling, and ending with SQL-based querying, stored procedures, and functions for analytics.

---

## README Index

1. Problem Statement
2. Dataset
3. Tools & Technologies
4. Data Modeling Approach
   1. Conceptual Model
   2. Physical Data Model
5. Data Preparation
6. Database Implementation
7. SQL Queries & Analysis
8. Stored Procedures & Functions
   1. Stored Procedures
   2. Functions
9. Key Outcomes & Benefits
10. How This Project Helps
11. Repository Structure

---

## 1. Problem Statement
Supply chain and logistics data is often large, complex, and difficult to analyze when stored in flat files. Without proper structure, answering questions related to customer behavior, order performance, profitability, or delivery efficiency becomes inefficient and error-prone.

This project addresses that problem by:
- Designing a normalized relational database
- Enforcing data integrity using primary and foreign keys
- Enabling efficient querying for operational and analytical insights

---

## 2. Dataset
The dataset used in this project contains detailed supply chain transaction data, including:
- Orders and order items
- Product and category information
- Customer details
- Shipping and delivery metrics
- Profitability and sales measures

The raw dataset was initially provided as a single file and later split into multiple entity-specific files during data preparation.

---

## 3. Tools & Technologies
- **Python (Pandas, Jupyter Notebook)** – Data cleaning, transformation, and table generation  
- **MySQL & MySQL Workbench** – Database creation, data loading, and querying  
- **SQL** – Table definitions, joins, subqueries, aggregations  
- **GitHub** – Version control and project documentation  

---

## 4. Data Modeling Approach

### 4.1 Conceptual Model
The conceptual model identifies key business entities and their relationships:
- Customers place Orders
- Orders contain multiple Products
- Products belong to Categories
- Categories belong to Departments

Since one order can include multiple products and a product can appear in many orders, a **many-to-many relationship** exists between Orders and Products. This is resolved using a junction table (`Order_items`).

---

### 4.2 Physical Data Model
The physical model consists of six tables:
- Departments  
- Categories  
- Products  
- Customers  
- Orders  
- Order_items (junction table)

Each table includes:
- Proper primary keys
- Foreign key relationships
- Carefully selected datatypes
- NOT NULL constraints where appropriate to ensure data integrity

Datatypes were adjusted after exploring and cleaning the data to ensure accurate storage of dates, monetary values, and identifiers.

---

## 5. Data Preparation
Data cleaning and preparation were performed in Python using Pandas:
- Column selection and renaming
- Removal of invalid or incomplete records
- Datatype standardization
- Splitting the dataset into table-specific CSV files

This step ensured compatibility with MySQL constraints and minimized data-loading errors.

---

## 6. Database Implementation
The database was created in MySQL with:
- Enforced referential integrity
- Controlled load order to satisfy foreign key constraints
- Successful bulk data imports using MySQL Workbench and LOAD DATA INFILE

---

## 7. SQL Queries & Analysis
The project includes:
- Basic SELECT queries ordered by primary keys
- INNER JOIN and LEFT JOIN queries across multiple tables
- Single-row and multi-row subqueries
- Aggregation queries using GROUP BY
- Conditional logic using CASE
- Subqueries using NOT IN and NOT EXISTS

These queries demonstrate how structured data enables efficient business insights.

---

## 8. Stored Procedures & Functions
To extend database functionality:

### 8.1 Stored Procedures
1. **Monthly Sales Summary** – Generates order, profit, and delivery metrics for a given month  
2. **Customer Order History** – Returns aggregated order and item-level details for a specific customer  

### 8.2 Functions
1. **Profit Margin Function** – Calculates profit percentage per order  
2. **Net Item Value Function** – Computes net revenue per order item after discounts  

These improve reusability, readability, and performance of analytical queries.

---

## 9. Key Outcomes & Benefits
- Converts raw supply chain data into a scalable relational database
- Enables faster and more reliable analytics
- Demonstrates real-world database design principles
- Supports business decision-making related to pricing, delivery risk, and profitability

---

## 10. How This Project Helps
This database design can be directly applied to real logistics and e-commerce systems to:
- Track order performance
- Identify late delivery risks
- Analyze customer purchasing behavior
- Evaluate product and category profitability

---

## 11. Repository Structure

```text
Database-Design-Swiftlogix-Supply-Chain/
├── Dataset/
│   ├── csv Files/
│   │   ├── Categories.csv
│   │   ├── Customers.csv
│   │   ├── Departments.csv
│   │   ├── Order_Items.csv
│   │   ├── Orders.csv
│   │   ├── Orders_FA.csv
│   │   ├── Orders_SA.csv
│   │   └── .DS_Store
│   ├── xlsx Files/
│   │   ├── DataCoSupplyChainDataset.xlsx
│   │   ├── DescriptionDataCoSupplyChain.xlsx
│   │   └── tokenized_access_logs.xlsx
│   └── .DS_Store
│
├── Documentation PDF/
│   ├── IS455_ProjectUpdate1_Yadav.pdf
│   ├── IS455_ProjectUpdate2_Yadav.pdf
│   ├── ISS455_FinalProjectReport_Yadav.pdf
│   └── .DS_Store
│
├── Physical Model/
│   └── Project Draft.drawio
│
├── Project Questions/
│   ├── Question1.sql
│   ├── Question2.sql
│   ├── Question3.sql
│   ├── Question4.sql
│   ├── Question5.sql
│   ├── Question6.sql
│   ├── Question7.sql
│   ├── Question8.sql
│   ├── Question9.sql
│   ├── Question10.sql
│   └── .DS_Store
│
├── Python Files/
│   ├── DDP_Errors_Fixing.ipynb
│   ├── DDP_Project_Initialization.ipynb
│   └── .ipynb_checkpoints/
│       ├── DDP_Errors_Fixing-checkpoint.ipynb
│       └── DDP_Project_Initialization-checkpoint.ipynb
│
├── SQL Files/
│   ├── db_table_creation.sql
│   ├── fn_net_item_value.sql
│   ├── fn_profit_margin.sql
│   ├── GetCustomerOrderHistorySP.sql
│   ├── GetMonthlySalesSummarySP.sql
│   ├── local_infile_ON.sql
│   └── Order_local_import.sql
│
├── Screenshots/
│   ├── DB and Table Creation/
│   │   ├── Categories.png
│   │   ├── Create Database.png
│   │   ├── Customers.png
│   │   ├── Departments.png
│   │   ├── Order_items.png
│   │   ├── Orders.png
│   │   └── Products.png
│   ├── Physical Data Model/
│   │   └── Updated Physical Data Model .png
│   ├── Project Questions/
│   │   ├── 1.1.png
│   │   ├── 1.2.png
│   │   ├── 1.3.png
│   │   ├── 1.4.png
│   │   ├── 1.5.png
│   │   ├── 1.6.png
│   │   ├── 2.0.png
│   │   ├── 3.0.png
│   │   ├── 4.0.png
│   │   ├── 5.0.png
│   │   ├── 6.0.png
│   │   ├── 7.0.png
│   │   ├── 8.0.png
│   │   ├── 9.0.png
│   │   ├── 10.0.png
│   │   └── .DS_Store
│   └── .DS_Store
│
├── .git/
├── .ipynb_checkpoints/
│   └── README-checkpoint.md
├── .DS_Store
└── README.md
```
---
