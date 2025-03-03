SELECT CompanyName, LEN(CompanyName) as CompanyNameLength
FROM Customers;

SELECT LastName, UPPER(LastName) as UppercaseLastName
FROM Employees;

SELECT FirstName, LastName, CONCAT(FirstName, ' ', LastName) as FullName
FROM Employees;

SELECT FirstName, LEFT(LastName, 1) as Initial
FROM Employees;

SELECT AVG(LEN(CompanyName)) as AvgCompanyNameLength
FROM Customers;

SELECT OrderDate, YEAR(OrderDate) as OrderYear
FROM Orders;

SELECT LTRIM(RTRIM(LOWER(FirstName))) as LowercaseFirstName, LTRIM(RTRIM(LOWER(LastName))) as LowercaseLastName
FROM Employees;

SELECT ROUND(AVG(OrderDetails.UnitPrice * OrderDetails.Quantity * (1 - OrderDetails.Discount)), 2) as AvgOrderValue
FROM OrderDetails;

SELECT DISTINCT YEAR(OrderDate) as OrderYear, DATEPART(QUARTER, OrderDate) as OrderQuarter
FROM Orders;

SELECT DATEDIFF(YEAR, BirthDate, GETDATE()) as Age
FROM Employees;

SELECT FirstName, LastName, Title
FROM Employees
WHERE Title LIKE '%Manager%';

SELECT Country, COUNT(*) as NumberOfCustomers
FROM Customers
GROUP BY Country
ORDER BY NumberOfCustomers DESC;

SELECT Products.ProductName, COUNT(*) as NumberOfOrders
FROM Orders
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY Products.ProductName
ORDER BY NumberOfOrders DESC;


