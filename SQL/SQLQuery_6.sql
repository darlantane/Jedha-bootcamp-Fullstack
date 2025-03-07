DECLARE @categoryName VARCHAR(50)
SET @categoryName = 'Beverages';

SELECT *
FROM Products
WHERE CategoryID = (
    SELECT CategoryID
    FROM Categories
    WHERE CategoryName = @categoryName
);

DECLARE @employeeId INT = 5;

SELECT *
FROM Orders
WHERE EmployeeID = @employeeId;


ALTER TABLE Orders ADD TotalCost MONEY;
ALTER TABLE Categories ADD TotalSales MONEY;
ALTER TABLE Products ADD TotalSales MONEY;

DECLARE @orderId INT, @totalCost MONEY;

DECLARE orderCursor CURSOR FOR
SELECT OrderID
FROM Orders
WHERE ShippedDate IS NULL;

OPEN orderCursor;

FETCH NEXT FROM orderCursor INTO @orderId;

WHILE @@FETCH_STATUS = 0
BEGIN
    SELECT @totalCost = SUM(od.UnitPrice * od.Quantity)
    FROM OrderDetails AS od
    WHERE od.OrderID = @orderId;

    UPDATE Orders
    SET TotalCost = @totalCost
    WHERE OrderID = @orderId;

    FETCH NEXT FROM orderCursor INTO @orderId;
END;

CLOSE orderCursor;
DEALLOCATE orderCursor;

DECLARE @customerId NVARCHAR(5) = 'ALFKI';
DECLARE @orderId INT, @totalCost MONEY;

DECLARE orderCursor CURSOR FOR
SELECT OrderID
FROM Orders
WHERE CustomerID = @customerId;

OPEN orderCursor;

FETCH NEXT FROM orderCursor INTO @orderId;

WHILE @@FETCH_STATUS = 0
BEGIN
    SELECT @totalCost = SUM(od.UnitPrice * od.Quantity)
    FROM OrderDetails AS od
    WHERE od.OrderID = @orderId;

    UPDATE Orders
    SET TotalCost = @totalCost
    WHERE OrderID = @orderId;

    FETCH NEXT FROM orderCursor INTO @orderId;
END;

CLOSE orderCursor;
DEALLOCATE orderCursor;

DECLARE @productId INT, @totalSales MONEY;

DECLARE productCursor CURSOR FOR
SELECT ProductID
FROM Products
WHERE UnitPrice > 50;

OPEN productCursor;

FETCH NEXT FROM productCursor INTO @productId;

WHILE @@FETCH_STATUS = 0
BEGIN
    SELECT @totalSales = SUM(od.UnitPrice * od.Quantity)
    FROM OrderDetails AS od
    WHERE od.ProductID = @productId;

    UPDATE Products
    SET TotalSales = @totalSales
    WHERE ProductID = @productId;

    FETCH NEXT FROM productCursor INTO @productId;
END;

CLOSE productCursor;
DEALLOCATE productCursor;

DECLARE @categoryName NVARCHAR(15) = 'Produce';
DECLARE @orderId INT, @totalCost MONEY;
DECLARE @totalSales MONEY = 0;

DECLARE orderCursor CURSOR FOR
SELECT od.OrderID
FROM OrderDetails AS od
JOIN Products AS p ON od.ProductID = p.ProductID
JOIN Categories AS c ON p.CategoryID = c.CategoryID
WHERE c.CategoryName = @categoryName
GROUP BY od.OrderID;

OPEN orderCursor;

FETCH NEXT FROM orderCursor INTO @orderId;

WHILE @@FETCH_STATUS = 0
BEGIN
    SELECT @totalCost = SUM(od.UnitPrice * od.Quantity)
    FROM OrderDetails AS od
    WHERE od.OrderID = @orderId;

    UPDATE Orders
    SET TotalCost = @totalCost
    WHERE OrderID = @orderId;

    SET @totalSales = @totalSales + @totalCost;

    FETCH NEXT FROM orderCursor INTO @orderId;
END;

CLOSE orderCursor;
DEALLOCATE orderCursor;

UPDATE Categories
SET TotalSales = @totalSales
WHERE CategoryName = @categoryName;


