CREATE TABLE CustomerFeedback (
  FeedbackID INT PRIMARY KEY,
  CustomerID INT NOT NULL,
  FeedbackText NVARCHAR(1000) NOT NULL,
  FeedbackDate DATETIME NOT NULL
);

ALTER TABLE Products
ADD CategoryID INT;

ALTER TABLE Customers
ALTER COLUMN CompanyName NVARCHAR(100) NOT NULL;

ALTER TABLE Orders
ALTER COLUMN ShipCity NVARCHAR(100) NOT NULL;

CREATE TABLE OrderItems (
  OrderID INT NOT NULL,
  ProductID INT NOT NULL,
  Quantity INT NOT NULL,
  UnitPrice DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (OrderID, ProductID)
);

ALTER TABLE OrderItems
ADD CONSTRAINT CK_OrderItems_Quantity CHECK (Quantity > 0);

ALTER TABLE OrderItems
ALTER COLUMN UnitPrice DECIMAL(10,2) NOT NULL;

ALTER TABLE Customers
ADD PhoneNumber NVARCHAR(20);

CREATE TABLE EmployeeSales (
   EmployeeID INT NOT NULL,
   OrderID INT NOT NULL,
   SalesAmount DECIMAL(10,2) NOT NULL,
   PRIMARY KEY (EmployeeID, OrderID),
   CONSTRAINT FK_EmployeeSales_Employee FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID),
   CONSTRAINT FK_EmployeeSales_Orders FOREIGN KEY (OrderID) REFERENCES Orders (OrderID)
);

ALTER TABLE EmployeeSales
ADD CONSTRAINT CK_EmployeeSales_SalesAmount CHECK (SalesAmount > 0);

ALTER TABLE CustomerFeedback
ALTER COLUMN FeedbackDate DATETIME NOT NULL;

ALTER TABLE OrderItems
ADD CONSTRAINT FK_OrderItems_Products
FOREIGN KEY (ProductID) REFERENCES Products (ProductID);

CREATE TABLE SupplierProducts (
   SupplierID INT NOT NULL,
   ProductID INT NOT NULL,
   Price DECIMAL(10,2) NOT NULL,
   PRIMARY KEY (SupplierID, ProductID),
   CONSTRAINT FK_SupplierProducts_Suppliers FOREIGN KEY (SupplierID) REFERENCES Suppliers (SupplierID),
   CONSTRAINT FK_SupplierProducts_Products FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
);
