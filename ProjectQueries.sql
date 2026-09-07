/*--------------------------------------------------------------------------------*/
# 1. Retrieve all books in the "Fiction" Category
SELECT *
FROM Books
WHERE Category="Fiction";

# 2. Find books published after the year 1950
SELECT *
FROM Books
WHERE Published_year>1950;

# 3. List all customers from the Canada
SELECT *
FROM Customer
WHERE Country="Canada";

# 4. Show orders placed in November 2023
SELECT *
FROM order_details
WHERE Order_Date BETWEEN '2023-11-01' AND '2023-11-30';

# 5. Retrieve the total stock of books available
SELECT SUM(Stock) AS Total_Stock
FROM Books;

# 6. Find the details of the most expensive book
SELECT * 
FROM books
ORDER BY Price DESC
LIMIT 1;

# 7. Show all customers who ordered more than 1 quantity of a book
SELECT * FROM order_details
WHERE Quantity>1
;
SELECT * FROM customer
WHERE Customer_ID IN(SELECT DISTINCT Customer_ID FROM order_details
WHERE Quantity>1);

# 8. Retrieve all orders where the total amount exceeds $20
SELECT * FROM order_details
WHERE Total_Amount > 20;

# 9. List all genres available in the Books table
SELECT DISTINCT Category
FROM books;

# 10. Find the book with the lowest stock
SELECT Title,Stock 
FROM Books
ORDER BY Stock
LIMIT 5;

# 11. Calculate the total revenue generated from all orders
SELECT SUM(Total_Amount) AS Total_revenue
FROM order_details;

/*----------------------------------------------------------------------------------------*/

#Advance Queries

# 1. Retrieve the total number of books sold for each genre
SELECT b.Category,SUM(o.Quantity) AS Total_Book_Sold
FROM order_details o
JOIN books b
ON o.Book_ID= b.Book_ID
GROUP BY b.Category;

# 2. Find the average price of books in the "Fantasy" genre
SELECT AVG(Price) AS Avg_Price
FROM books
WHERE Category = "Fantasy";

# 3. List customers who have placed at least 2 orders
#First mathod
SELECT customer_ID , COUNT(Order_ID) AS Order_Count
FROM order_details
GROUP BY customer_ID
HAVING COUNT(Order_ID)>=2;

#Second mathod when we want to show the name of customer name 
SELECT c.Name , Count(o.order_ID)
FROM order_details o
JOIN customer c
ON o.Customer_ID=c.Customer_ID
GROUP BY c.Name
HAVING Count(o.order_ID)>=2;

# 4. Find the most frequently ordered book
select * from books;
SELECT b.Title AS Book_Name,COUNT(o.Order_ID) AS Freqanecy
FROM order_details o
JOIN books b
ON b.Book_ID=o.Book_ID
GROUP BY b.Title
ORDER BY Freqanecy DESC
LIMIT 5
;

# 5. Show the top 3 most expensive books of 'Fantasy' Category
SELECT Title,category,Price 
FROM Books
WHERE category='Fantasy'
ORDER BY Price DESC
LIMIT 3;

# 6. Retrieve the total quantity of books sold by each author
select * from books;
select * from order_details;

SELECT b.Author AS Writter ,o.Quantity
FROM order_details o
JOIN books b
ON o.Book_ID=b.Book_ID
;

# 7. List the cities where customers who spent over $30 are located
select * from books;
select * from order_details;
select * from customer;

SELECT c.city AS City, o.Total_Amount AS Spent
FROM order_details o
JOIN customer c
ON c.Customer_ID=o.Customer_ID
WHERE o.Total_Amount>30
ORDER BY Spent DESC
LIMIT 5;

# 8. Find the customer who spent the most on orders
select * from books;
select * from order_details;
select * from customer;

SELECT c.name AS Name, COUNT(o.Order_ID) No_Order
FROM order_details o
JOIN customer c
ON o.Customer_ID=c.Customer_ID
GROUP BY Name
ORDER BY No_Order DESC;

# 9. Calculate the stock remaining after fulfilling all orders
SELECT b.Title,b.Stock - COALESCE(SUM(o.Quantity), 0) AS Remaining_Stock
FROM Books b
LEFT JOIN Order_details o
ON b.Book_ID = o.Book_ID
GROUP BY b.Book_ID, b.Title, b.Stock;