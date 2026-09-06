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
<h5>
Relationships</h5>
Customer.Customer_ID
        ↓
Order_details.Customer_ID

Books.Book_ID
        ↓
Order_details.Book_ID

<h6> This helps maintain referential integrity between customers, books, and orders.</h6>
