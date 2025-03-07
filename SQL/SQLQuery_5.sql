INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES ('NEWID', 'New Company', 'John Doe', 'Manager', '123 New Street', 'New City', 'New Region', '12345', 'New Country', '555-1234', '555-5678');

DELETE FROM Customers
WHERE CustomerID = 'NEWID';

UPDATE Customers
SET Phone = '555-9876'
WHERE CustomerID = 'ALFKI';

DELETE FROM OrderDetails
WHERE Quantity < 10;

UPDATE OrderDetails
SET Quantity = 15, UnitPrice = 20
WHERE OrderID = 10248 AND ProductID = 11;

-- Insert the new order into the Orders table
INSERT INTO Orders (CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipVia, Freight, ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry)
VALUES ('WOLZA', 3, '2023-03-22', '2023-04-05', '2023-03-27', 2, 35.90, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warsaw', NULL, '02-056', 'Poland');

-- Use the retrieved OrderID in the INSERT statement for the OrderDetails table.
DECLARE @NewOrderID INT;
SET @NewOrderID = SCOPE_IDENTITY();

INSERT INTO OrderDetails (OrderID, ProductID, UnitPrice, Quantity)
VALUES (@NewOrderID, 4, 21.35, 10),
       (@NewOrderID, 7, 30.00, 20),
       (@NewOrderID, 19, 8.99, 30);

INSERT INTO OrderDetails (OrderID, ProductID, UnitPrice, Quantity, Discount)
SELECT o.OrderID, p.ProductID, p.UnitPrice, 1, 0
FROM Orders o
JOIN Products p ON p.UnitPrice > 50
WHERE o.OrderDate = '1996-07-04';

-- Add the 'OrderStatus' column to the Orders table
ALTER TABLE Orders
ADD OrderStatus NVARCHAR(255);

-- Update the order status
UPDATE Orders
SET OrderStatus = 'Frequent Customer'
WHERE CustomerID IN (
  SELECT CustomerID
  FROM Orders
  WHERE OrderDate BETWEEN DATEADD(MONTH, -1, GETDATE()) AND GETDATE() -- Filter orders from the past month
  GROUP BY CustomerID
  HAVING COUNT(OrderID) > 5 -- Check if the customer has placed more than 5 orders
);
