--1)
SELECT * FROM [HumanResources].[Employee] ORDER BY JobTitle ASC

--2)
SELECT * FROM [Person].[Person] AS e ORDER BY e.LastName ASC

--3)
SELECT FirstName, LastName, businessentityid AS Employee_id FROM [Person].[Person] ORDER BY LastName ASC

--4) 
SELECT productid,productnumber,Name FROM [Production].[Product] 
WHERE SellStartDate IS NOT NULL AND ProductLine = 'T'
ORDER BY Name ASC

--5) 
SELECT SalesOrderID,CustomerID,OrderDate,SubTotal,(TaxAmt / SubTotal) * 100 AS tax_percent
FROM [Sales].[SalesOrderHeader]
ORDER BY SubTotal ASC

--6)
SELECT DISTINCT JobTitle FROM [HumanResources].[Employee]
ORDER BY JobTitle ASC

--7)
SELECT CustomerID, sum(Freight) AS total_freight
FROM [Sales].[SalesOrderHeader]
GROUP BY CustomerID
ORDER BY CustomerID ASC

--8)
SELECT CustomerID, SalesPersonID, AVG(SubTotal) AS avg_subtotal, SUM(SubTotal) AS sum_subtotal
FROM [Sales].[SalesOrderHeader]
GROUP BY CustomerID, SalesPersonID
ORDER BY CustomerID DESC

--9)
--select * from [Production].[ProductInventory]
SELECT ProductID,SUM(Quantity) AS total_quantity
FROM [Production].[ProductInventory]
WHERE Shelf = 'A' OR Shelf = 'C' OR Shelf = 'H'
GROUP BY ProductID
HAVING SUM(Quantity) > 500
ORDER BY ProductID ASC;

--10)
--select * from [Production].[ProductInventory]
SELECT SUM(Quantity)*10 AS total_quantity
FROM [Production].[ProductInventory]
GROUP BY LocationID
ORDER BY LocationID;

--11)
--select * from [Person].[Person]
--select * from [Person].[PersonPhone]
SELECT p.BusinessEntityID, p.FirstName, p.LastName, ph.PhoneNumber
FROM Person.Person p
LEFT JOIN Person.PersonPhone ph
    ON p.BusinessEntityID = ph.BusinessEntityID
WHERE p.LastName LIKE 'L%' 
ORDER BY p.LastName ASC, p.FirstName ASC;

--12)
SELECT SalesPersonID, CustomerID, SUM(SubTotal) AS sum_subtotal
FROM [Sales].[SalesOrderHeader]
GROUP BY SalesPersonID, CustomerID
ORDER BY SalesPersonID, CustomerID

--13) 
SELECT LocationID,Shelf,SUM(Quantity) AS TotalQuantity
FROM [Production].[ProductInventory]
GROUP BY LocationID, Shelf
ORDER BY LocationID, Shelf;

--14)
SELECT LocationID,Shelf,SUM(Quantity) AS TotalQuantity
FROM [Production].[ProductInventory]
GROUP BY LocationID, Shelf
ORDER BY LocationID, Shelf;

--15)
SELECT LocationID, SUM(Quantity) AS TotalQuantity
FROM [Production].[ProductInventory]
GROUP BY LocationID
ORDER BY LocationID;


--16)
--select * from [HumanResources].[Employee]
--select * from [Person].[BusinessEntityAddress]

--17)
SELECT YEAR(OrderDate) AS OrderYear, SUM(TotalDue) AS TotalSales
FROM [Sales].[SalesOrderHeader]
GROUP BY YEAR(OrderDate)
ORDER BY OrderYear ASC;

--18)
SELECT YEAR(OrderDate) AS OrderYear, SUM(TotalDue) AS TotalSales
FROM [Sales].[SalesOrderHeader]
WHERE YEAR(OrderDate) <= 2016
GROUP BY YEAR(OrderDate)
ORDER BY OrderYear ASC;

--19)
SELECT ContactTypeID,Name
FROM	 [Person].[ContactType]
WHERE Name LIKE '%Manager%'
ORDER BY Name DESC;

--20)