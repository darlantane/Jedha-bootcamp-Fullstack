SELECT SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) as TotalRevenue
FROM OrderDetails as od;

SELECT AVG(TotalRevenue) as AverageRevenuePerOrder
FROM (
    SELECT o.OrderID, SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) as TotalRevenue
    FROM Orders as o
    JOIN OrderDetails as od ON o.OrderID = od.OrderID
    GROUP BY o.OrderID
) as SubQuery;

SELECT TOP 5 p.ProductID, p.ProductName, SUM(od.Quantity) as TotalQuantitySold
FROM Products as p
JOIN OrderDetails as od ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalQuantitySold DESC;

SELECT COALESCE(c.Country, 'Grand Total') as Country, COALESCE(c.CustomerID, 'Total') as CustomerID, COALESCE(c.CompanyName, 'All Customers') as CompanyName, SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) as TotalRevenue
FROM Customers as c
JOIN Orders as o ON c.CustomerID = o.CustomerID
JOIN OrderDetails as od ON o.OrderID = od.OrderID
GROUP BY ROLLUP (c.Country, c.CustomerID, c.CompanyName);

SELECT e.EmployeeID, e.FirstName, e.LastName, SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) as TotalSales
FROM Employees as e
JOIN Orders as o ON e.EmployeeID = o.EmployeeID
JOIN OrderDetails as od ON o.OrderID = od.OrderID
GROUP BY e.EmployeeID, e.FirstName, e.LastName;

SELECT TOP 3 e.EmployeeID, e.FirstName, e.LastName, AVG(TotalRevenue) as AverageRevenuePerOrder
FROM Employees as e
JOIN Orders as o ON e.EmployeeID = o.EmployeeID
JOIN (
    SELECT od.OrderID, SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) as TotalRevenue
    FROM OrderDetails as od
    GROUP BY od.OrderID
) as SubQuery ON o.OrderID = SubQuery.OrderID
GROUP BY e.EmployeeID, e.FirstName, e.LastName
ORDER BY AverageRevenuePerOrder DESC;
