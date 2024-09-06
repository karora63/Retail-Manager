-- 1. Retrieve all products with their category names
SELECT P.productName, C.categoryName
FROM Products P
JOIN Categories C ON P.categoryId = C.categoryId;

-- 2. Retrieve all products along with their prices and stock quantities
SELECT productName, price, stockQuantity
FROM Products;

-- 3. List all orders with their total amount, order date, and the customer who placed them
SELECT O.orderId, O.orderDate, O.totalAmount, C.firstName || ' ' || C.lastName AS CustomerName
FROM Orders O
JOIN Customers C ON O.customerId = C.customerId;

-- 4. Retrieve all products ordered, their quantities, and total amount per order
SELECT O.orderId, P.productName, OD.quantity, OD.unitPrice, 
       (OD.quantity * OD.unitPrice) AS TotalAmount
FROM OrderDetails OD
JOIN Orders O ON OD.orderId = O.orderId
JOIN Products P ON OD.productId = P.productId;

-- 5. Find the total number of orders placed by each customer
SELECT C.firstName || ' ' || C.lastName AS CustomerName, COUNT(O.orderId) AS TotalOrders
FROM Customers C
JOIN Orders O ON C.customerId = O.customerId
GROUP BY C.firstName, C.lastName;

-- 6. Retrieve all employees and their store locations
SELECT E.firstName || ' ' || E.lastName AS EmployeeName, SL.storeName
FROM Employees E
JOIN StoreLocation SL ON E.storeLocationId = SL.storeLocationId;

-- 7. Find the total sales amount for each product (quantity * unit price)
SELECT P.productName, SUM(OD.quantity * OD.unitPrice) AS TotalSales
FROM OrderDetails OD
JOIN Products P ON OD.productId = P.productId
GROUP BY P.productName;

-- 8. Retrieve all orders placed at a specific store location (e.g., 'Main St Store')
SELECT O.orderId, O.orderDate, O.totalAmount
FROM Orders O
JOIN StoreLocation SL ON O.storeLocationId = SL.storeLocationId
WHERE SL.storeName = 'Main St Store';

-- 9. List all employees working in a specific store location (e.g., 'Main St Store')
SELECT E.firstName || ' ' || E.lastName AS EmployeeName, E.role
FROM Employees E
JOIN StoreLocation SL ON E.storeLocationId = SL.storeLocationId
WHERE SL.storeName = 'Main St Store';

-- 10. Retrieve the details of a specific order, including the product names, quantities, and unit prices
SELECT O.orderId, P.productName, OD.quantity, OD.unitPrice
FROM OrderDetails OD
JOIN Products P ON OD.productId = P.productId
JOIN Orders O ON OD.orderId = O.orderId
WHERE O.orderId = 1;

-- 11. Find the customer who has placed the most orders
SELECT C.firstName || ' ' || C.lastName AS CustomerName, COUNT(O.orderId) AS TotalOrders
FROM Customers C
JOIN Orders O ON C.customerId = O.customerId
GROUP BY C.firstName, C.lastName
ORDER BY COUNT(O.orderId) DESC
FETCH FIRST 1 ROWS ONLY;

-- 12. Retrieve all customers who have placed more than 2 orders
SELECT C.firstName || ' ' || C.lastName AS CustomerName, COUNT(O.orderId) AS TotalOrders
FROM Customers C
JOIN Orders O ON C.customerId = O.customerId
GROUP BY C.firstName, C.lastName
HAVING COUNT(O.orderId) > 2;

-- 13. List all orders along with their total number of products (from OrderDetails)
SELECT O.orderId, COUNT(OD.productId) AS NumberOfProducts
FROM Orders O
JOIN OrderDetails OD ON O.orderId = OD.orderId
GROUP BY O.orderId;

-- 14. Retrieve all products supplied by a specific supplier (e.g., 'XYZ Electronics')
SELECT P.productName, P.price
FROM Products P
JOIN Suppliers S ON P.supplierId = S.supplierId
WHERE S.supplierName = 'XYZ Electronics';

-- 15. Retrieve orders placed in a specific time period (e.g., July 2024)
SELECT orderId, orderDate, totalAmount
FROM Orders
WHERE orderDate BETWEEN TO_DATE('2024-07-01', 'YYYY-MM-DD') AND TO_DATE('2024-07-31', 'YYYY-MM-DD');

-- 16. Retrieve the average order amount
SELECT AVG(totalAmount) AS AverageOrderAmount
FROM Orders;

-- 17. Retrieve products that are out of stock
SELECT productName
FROM Products
WHERE stockQuantity = 0;

-- 18. Find the most expensive product in the store
SELECT productName, price
FROM Products
ORDER BY price DESC
FETCH FIRST 1 ROWS ONLY;

-- 19. Find the total number of orders placed at each store location
SELECT SL.storeName, COUNT(O.orderId) AS TotalOrders
FROM StoreLocation SL
JOIN Orders O ON SL.storeLocationId = O.storeLocationId
GROUP BY SL.storeName;

-- 20. Find the customer who spent the most money in total
SELECT C.firstName || ' ' || C.lastName AS CustomerName, SUM(O.totalAmount) AS TotalSpent
FROM Customers C
JOIN Orders O ON C.customerId = O.customerId
GROUP BY C.firstName, C.lastName
ORDER BY SUM(O.totalAmount) DESC
FETCH FIRST 1 ROWS ONLY;