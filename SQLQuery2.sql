CREATE DATABASE RetailStoreDB;
USE RetailStoreDB;

CREATE TABLE Customers(
CustomerID INT PRIMARY KEY identity,
FirstName VARCHAR(100),
LastName VARCHAR(100),
Email VARCHAR(100),
RegistrationDate DATE,
);

CREATE TABLE Products(
ProductID INT PRIMARY KEY identity,
ProductName VARCHAR(100),
Category VARCHAR(100),
Price DECIMAL(10,2),
StockQuantity INT,
);

CREATE TABLE Orders(
OrderID INT PRIMARY KEY identity,
CustomerID INT,
ProductID INT,
OrderDate DATE,
Quantity INT,
Foreign Key (CustomerID) References Customers (CustomerID),
Foreign Key (ProductID) References Products (ProductID),
);


INSERT INTO Customers (FirstName,LastName,Email,RegistrationDate) VALUES
('MOHAMED','Khaled','Mohamedkh1@gmail.com','2024-02-14'),
('AHMED','Yasser','yasserah2@gmail.com','2024-03-19'),
('Ramy','Fathy','Ramyfa33@gmail.com','2024-08-11'),
('Gamal','Farouk','Gamalfa44@gmail.com','2024-09-16'),
('Rayan','Mohamed','Rayanmo66@gmail.com','2024-05-12');


INSERT INTO Products (ProductName, Category, Price, StockQuantity) VALUES
('Laptops', 'Electronics', 1200.00, 20),
('Smartphones', 'Electronics', 1650.00, 15),
('Headphones', 'Accessories', 1212.00, 30),
('Mouse', 'Accessories', 7021.00, 20),
('Monitor', 'Electronics', 8000.00, 12);

INSERT INTO Orders (CustomerID, ProductID, OrderDate, Quantity) VALUES
(1, 1, '2024-02-01', 1),
(2, 2, '2024-02-11', 2),
(3, 3, '2024-01-01', 1),
(4, 4, '2024-02-20', 3),
(5, 5, '2024-09-01', 1);


SELECT * FROM Customers; 
SELECT * FROM Products;
SELECT * FROM Orders;

SELECT * FROM Customers WHERE RegistrationDate > '2024-03-01';


SELECT TOP 3 * FROM Products ORDER BY Price DESC;

SELECT Orders.OrderID, Customers.FirstName, Customers.LastName, Products.ProductName, Orders.Quantity, Orders.OrderDate 
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN Products ON Orders.ProductID = Products.ProductID;


SELECT 
    Customers.CustomerID, 
    Customers.FirstName, 
    Customers.LastName, 
    SUM(Orders.Quantity * Products.Price) AS TotalSpent 
FROM 
    Orders
JOIN 
    Customers ON Orders.CustomerID = Customers.CustomerID
JOIN 
    Products ON Orders.ProductID = Products.ProductID
GROUP BY 
    Customers.CustomerID, 
    Customers.FirstName, 
    Customers.LastName;


SELECT 
    Customers.CustomerID, 
    Customers.FirstName, 
    Customers.LastName, 
    COUNT(Orders.OrderID) AS OrderCount 
FROM 
    Orders
JOIN 
    Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY 
    Customers.CustomerID, 
    Customers.FirstName, 
    Customers.LastName;



SELECT 
    Products.ProductID, 
    Products.ProductName, 
    SUM(Orders.Quantity) AS TotalQuantitySold 
FROM 
    Orders
JOIN 
    Products ON Orders.ProductID = Products.ProductID
GROUP BY 
    Products.ProductID, 
    Products.ProductName;