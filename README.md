# Book_Store_Project
Developed a MySQL-based Book Store Analysis project to analyze sales, customer orders, revenue, and inventory using advanced SQL queries, joins, aggregate functions, and subqueries.

# 📚 Online Bookstore SQL Project

## 📌 Project Overview

The **Online Bookstore SQL Project** is an end-to-end MySQL database project developed to manage and analyze an online bookstore's **books, customers, and order information**.

The project demonstrates practical SQL skills including **database creation, table design, primary and foreign keys, data validation, missing record identification, data cleaning, recursive CTEs, joins, and data verification**.

---

## 🎯 Project Objectives

- Create a structured relational database for an online bookstore.
- Store and manage book, customer, and order information.
- Establish relationships between tables using Primary and Foreign Keys.
- Validate the number of records available in each table.
- Identify missing records using SQL.
- Handle and reinsert missing records.
- Resolve datatype-related issues.
- Verify the final database structure and data.

---

## 🗂️ Database Structure

### Database Name

`Online_Bookstore`

### Tables

The project contains three main tables:

### 1. 📚 Books

Stores information about books available in the bookstore.

| Column | Data Type | Description |
|---|---|---|
| Book_ID | INT | Unique ID of each book |
| Title | VARCHAR(100) | Book title |
| Author | VARCHAR(50) | Book author |
| Category | VARCHAR(50) | Book category |
| Published_year | SMALLINT | Year of publication |
| Price | DECIMAL(10,2) | Book price |
| Stock | INT | Available stock |

---

### 2. 👤 Customer

Stores customer information.

| Column | Data Type | Description |
|---|---|---|
| Customer_ID | INT | Unique customer ID |
| Name | VARCHAR(100) | Customer name |
| Email | VARCHAR(50) | Customer email |
| Phone | INT | Customer phone number |
| City | VARCHAR(50) | Customer city |
| Country | VARCHAR(100) | Customer country |

---

### 3. 🛒 Order_details

Stores information about customer orders.

| Column | Data Type | Description |
|---|---|---|
| Order_ID | INT | Unique order ID |
| Customer_ID | INT | Customer reference |
| Book_ID | INT | Book reference |
| Order_Date | DATE | Order date |
| Quantity | INT | Quantity ordered |
| Total_Amount | DECIMAL(10,2) | Total order amount |

---

## 🔗 Table Relationships

The project uses foreign keys to maintain relationships between tables.

```text
Customer
   │
   │ Customer_ID
   ▼
Order_details
   ▲
   │ Book_ID
   │
Books


Relationships

Customer.Customer_ID
        ↓
Order_details.Customer_ID

Books.Book_ID
        ↓
Order_details.Book_ID

This helps maintain referential integrity between customers, books, and orders.

🔍 Project Workflow
1️⃣ Create Database
Created the Online_Bookstore database and selected it for further operations.

CREATE DATABASE Online_Bookstore;
USE Online_Bookstore;

2️⃣ Create Tables
Created three relational tables:

Books
Customer
Order_details

Primary keys were added to uniquely identify records.

3️⃣ Create Foreign Key Relationships
Foreign keys were added to connect orders with customers and books.
FOREIGN KEY (Customer_ID)
REFERENCES Customer(Customer_ID)

FOREIGN KEY (Book_ID)
REFERENCES Books(Book_ID)

4️⃣ Validate Record Counts
Used the COUNT() function to verify the number of records in each table.

SELECT COUNT(Book_ID) FROM Books;
SELECT COUNT(Customer_ID) FROM Customer;
SELECT COUNT(Order_ID) FROM Order_details;
This helped identify whether all expected records were successfully imported.

🔎 5️⃣ Identify Missing Book Records
A Recursive CTE was used to generate Book IDs from 1 to 500.
WITH RECURSIVE numbers AS (
    SELECT 1 AS Book_ID
    UNION ALL
    SELECT Book_ID + 1
    FROM numbers
    WHERE Book_ID < 500
)
SELECT numbers.Book_ID AS missing_Book_ID
FROM numbers
LEFT JOIN Books
    ON numbers.Book_ID = Books.Book_ID
WHERE Books.Book_ID IS NULL;

🛠️ 6️⃣ Reinsert Missing Records
The missing book records were inserted back into the database using INSERT INTO.
INSERT INTO Books VALUES
(...);

🔧 9️⃣ Handle Data Type Issues
During data insertion, datatype limitations were identified and resolved.
Published Year
The Published_year column was initially created using YEAR.
Since the dataset contained the year 1900, the datatype was changed to SMALLINT.
ALTER TABLE Books
MODIFY COLUMN Published_year SMALLINT;

ALTER TABLE Books
MODIFY COLUMN Published_year SMALLINT;

Country
Some country names exceeded the original VARCHAR(50) limit.
Therefore, the column size was increased:
ALTER TABLE Customer
MODIFY COLUMN Country VARCHAR(100);

🔍 Verify Table Structure
The DESC command was used to verify table structure and datatypes.

DESC Books;
DESC Customer;
DESC Order_details;

✅ Final Data Verification
SELECT * FROM Books;
SELECT * FROM Customer;
SELECT * FROM Order_details;

🧠 SQL Concepts Used

This project demonstrates the following SQL concepts:

Database Creation
Table Creation
Primary Key
Foreign Key
Referential Integrity
SELECT
COUNT()
LEFT JOIN
WHERE
IS NULL
WITH RECURSIVE
Recursive CTE
INSERT INTO
ALTER TABLE
MODIFY COLUMN
DESC
Data Validation
Data Cleaning
Missing Record Detection
Datatype Management
Date Handling
Relational Database Design

🛠️ Technologies Used
MySQL
MySQL Workbench
SQL
GitHub

📊 Project Outcome

Through this project, a complete relational database was created for an online bookstore. The project also demonstrates how SQL can be used not only for querying data but also for data validation, identifying missing records, handling datatype issues, maintaining relationships, and improving data quality.

📌 Author

Rishabh Sharma

B.Tech CSE | Aspiring Data Analyst


