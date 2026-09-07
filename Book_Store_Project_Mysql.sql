CREATE DATABASE Online_Bookstore;
USE Online_Bookstore;

/* create table for Book Infromation */
CREATE TABLE books(
Book_ID INT PRIMARY KEY,
Title VARCHAR(100),
Author VARCHAR(50),
Category VARCHAR(50),
Published_year YEAR,
Price DECIMAL(10,2),
Stock INT
);

/* create table for Customer Infromation */
CREATE TABLE Customer(
Customer_ID INT PRIMARY KEY,
Name VARCHAR(100),
Email VARCHAR(50),
Phone INT,
City VARCHAR(50),
Country VARCHAR(50)
);

/* create table for Order Infromation */
CREATE TABLE Order_details(
Order_ID INT PRIMARY KEY,
Customer_ID INT,
Book_ID INT,
Order_Date DATE,
Quantity INT,
Total_Amount DECIMAL(10,2),
FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
FOREIGN KEY (Book_ID) REFERENCES books(Book_ID)
);

/* Checking the inserted data quantity */
SELECT count(Book_ID) FROM Books;
SELECT count(Customer_ID ) FROM Customer;
SELECT count(Order_ID) FROM Order_details;

/* Identy missing values*/
WITH RECURSIVE numbers AS (
    SELECT 1 AS Book_ID
    UNION ALL
    SELECT Book_ID + 1
    FROM numbers
    WHERE Book_ID < 500
)
SELECT numbers.Book_ID AS missing_Book_ID
FROM numbers
LEFT JOIN books
    ON numbers.Book_ID = books.Book_ID
WHERE books.Book_ID IS NULL;

/* output*/
/*
missing_Book_ID
---------------
227
286
460
485
*/
/*We can reinsert these value with insert query*/
INSERT INTO Books VALUES
(227,"Centralized context-sensitive functionalities","Virginia Levine","Non-Fiction",1900,38.17,78),
(286,"Sharable client-driven contingency","Joseph Crawford","Non-Fiction",1900,8.29,84),
(460,"Optimized human-resource forecast","Rachel Travis","Romance",1900,35.80,39),
(485,"Decentralized content-based access","Nancy Taylor","Mystery",1900,23.16,57)
;

/*Checking the table structure*/
DESC books;
SELECT @@sql_mode;

/*Modify the table datatype*/
/*Now run the insert commond , date datatype only hold value after 1900*/
ALTER TABLE books
MODIFY COLUMN Published_year SMALLINT;

/*Now we check the mising values in customer table*/
With recursive cust as(
SELECT 1 AS Customer_ID
UNION ALL 
SELECT Customer_ID+1
FROM cust
WHERE Customer_ID<500
)
SELECT cust.Customer_ID AS Missing_ID
FROM cust
LEFT JOIN Customer
ON cust.Customer_ID=Customer.Customer_ID
WHERE Customer.Customer_ID IS null
;

/*Now insert the missing values*/
INSERT INTO Customer VALUES
(64,"Jennifer Clark","michael13@cantu-hawkins.com",1234567954,"Jamesville","British Indian Ocean Territory (Chagos Archipelago)"),
(224,"Julie Stewart","uthompson@hotmail.com",1234568114,"Smithmouth","British Indian Ocean Territory (Chagos Archipelago)") 
;

/*MODIFY TABLE*/
ALTER TABLE Customer
MODIFY COLUMN Country VARCHAR(100);

/*NOW CHECK THE MISSING VLAUE IN ORDER_DETAILS TABLE*/
WITH RECURSIVE Order_info AS(
SELECT 1 AS Order_ID
UNION ALL 
SELECT Order_ID+1
FROM Order_info
WHERE Order_ID<500
)
SELECT Order_info.Order_ID AS Missing_ID
FROM Order_info
LEFT JOIN Order_details
ON Order_info.Order_ID=Order_details.Order_ID
WHERE Order_details.Order_ID IS NULL;

/*Insert The missing data in Order_dertails table*/
INSERT INTO Order_details VALUES
(44,234,460,'2024-07-24',5,179.4),
(180,460,227,'2023-01-20',7,267.19),
(262,224,376,'2022-12-11',6,175.56),
(300,90,485,'2023-12-09',7,162.12),
(308,499,485,'2023-02-19',10,231.6),
(309,185,227,'2022-12-29',8,305.36),
(436,224,412,'2024-06-17',1,9.83);
/*DESCRIBE TABLE DETAILS ORDER_DETAILS*/
DESC Order_details;

/*VIEW THE TABLE*/
SELECT * FROM Books;
SELECT * FROM Customer;
SELECT * FROM Order_details;
