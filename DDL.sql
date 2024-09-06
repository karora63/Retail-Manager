-- Inserting into Categories
INSERT INTO Categories (categoryId, categoryName, description)
VALUES (1, 'Electronics', 'Electronic gadgets and devices');

-- Inserting into Suppliers
INSERT INTO Suppliers (supplierId, supplierName, contactInfo, address)
VALUES (1, 'XYZ Electronics', 'abc@gmail.com', '123 Main St');

-- Inserting into Products
INSERT INTO Products (productId, productName, categoryId, supplierId, price, stockQuantity)
VALUES (1, 'Smartphone X', 1, 1, 499.99, 50);

-- Inserting into Customers
INSERT INTO Customers (customerId, firstName, lastName, email, phoneNumber)
VALUES (1, 'Leo', 'Doe', 'leo-2@myseneca.ca', '437-616-1896');

-- Inserting into StoreLocation
INSERT INTO StoreLocation (storeLocationId, storeName, address, phone)
VALUES (1, 'Main St Store', '23 Muldrew Ave', '437-616-1896');

-- Inserting into Employees
INSERT INTO Employees (employeeId, firstName, lastName, role, storeLocationId)
VALUES (1, 'Leo', 'Smith', 'Manager', 1);

-- Inserting into Orders
INSERT INTO Orders (orderId, customerId, orderDate, totalAmount, storeLocationId)
VALUES (1, 1, TO_DATE('2024/07/01', 'YYYY/MM/DD'), 95.00, 1);

-- Inserting into OrderDetails
INSERT INTO OrderDetails (orderDetailId, orderId, productId, quantity, unitPrice)
VALUES (1, 1, 1, 2, 490.99);