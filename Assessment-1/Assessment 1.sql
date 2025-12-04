--1)
SELECT * FROM [HumanResources].[Employee] ORDER BY JobTitle ASC;

--2)
SELECT * FROM [Person].[Person] AS e ORDER BY e.LastName ASC;

--3)
SELECT FirstName, LastName, businessentityid AS Employee_id FROM [Person].[Person] ORDER BY LastName ASC;

--4) 
SELECT productid,productnumber,Name FROM [Production].[Product] 
WHERE SellStartDate IS NOT NULL AND ProductLine = 'T'
ORDER BY Name ASC;

--5) 
SELECT SalesOrderID,CustomerID,OrderDate,SubTotal,(TaxAmt / SubTotal) * 100 AS tax_percent
FROM [Sales].[SalesOrderHeader]
ORDER BY SubTotal ASC;

--6)
SELECT DISTINCT JobTitle FROM [HumanResources].[Employee]
ORDER BY JobTitle ASC;

--7)
SELECT CustomerID, sum(Freight) AS total_freight
FROM [Sales].[SalesOrderHeader]
GROUP BY CustomerID  --we have multiple customer ID's so we first need to group them
ORDER BY CustomerID ASC;

--8)
SELECT CustomerID, SalesPersonID, AVG(SubTotal) AS avg_subtotal, SUM(SubTotal) AS sum_subtotal
FROM [Sales].[SalesOrderHeader]
GROUP BY CustomerID, SalesPersonID
ORDER BY CustomerID DESC;

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
FROM [Person].[Person] p
LEFT JOIN [Person].[PersonPhone] ph
    ON p.BusinessEntityID = ph.BusinessEntityID
WHERE p.LastName LIKE 'L%' 
ORDER BY p.LastName ASC, p.FirstName ASC;

--12)
SELECT DISTINCT SalesPersonID, CustomerID, SUM(SubTotal) AS sum_subtotal
FROM [Sales].[SalesOrderHeader]
WHERE SalesPersonID IS NOT NULL AND CustomerID IS NOT NULL
GROUP BY SalesPersonID, CustomerID
ORDER BY SalesPersonID, CustomerID

SELECT DISTINCT SalesPersonID, CustomerID, SUM(SubTotal) AS sum_subtotal
FROM [Sales].[SalesOrderHeader]
WHERE SalesPersonID IS NOT NULL AND CustomerID IS NOT NULL
GROUP BY ROLLUP(SalesPersonID, CustomerID) --rollup automatically adds subtotals and grand totals to your grouped results
ORDER BY SalesPersonID, CustomerID


--13) 
SELECT LocationID,Shelf,SUM(Quantity) AS TotalQuantity
FROM [Production].[ProductInventory]
GROUP BY LocationID, Shelf
ORDER BY LocationID, Shelf;

SELECT DISTINCT LocationID,Shelf,SUM(Quantity) AS TotalQuantity
FROM [Production].[ProductInventory]
GROUP BY LocationID, Shelf
ORDER BY LocationID, Shelf;


--14)
SELECT DISTINCT LocationID,Shelf,SUM(Quantity) AS TotalQuantity
FROM [Production].[ProductInventory]
GROUP BY ROLLUP(LocationID, Shelf)
ORDER BY LocationID, Shelf;

--15)
SELECT LocationID, SUM(Quantity) AS TotalQuantity
FROM [Production].[ProductInventory]
GROUP BY ROLLUP(LocationID)
ORDER BY LocationID;


--16)
SELECT City,COUNT(*) AS NumberOfEmployees
FROM [Person].[Address]
GROUP BY City
ORDER BY City ASC;



--17)
SELECT YEAR(OrderDate) AS Year, SUM(TotalDue) AS Order_Amount
FROM [Sales].[SalesOrderHeader]
GROUP BY YEAR(OrderDate)
ORDER BY Year ASC;

--18)
SELECT YEAR(OrderDate) AS yearoforderdate, SUM(TotalDue) AS totaldueorder
FROM [Sales].[SalesOrderHeader]
WHERE YEAR(OrderDate) <= 2016
GROUP BY YEAR(OrderDate)
ORDER BY yearoforderdate ASC;

--19)
SELECT ContactTypeID,Name
FROM [Person].[ContactType]
WHERE Name LIKE '%Manager%'
ORDER BY Name DESC;

--20)


--21)
SELECT 
    ROW_NUMBER() OVER (
        PARTITION BY addr.PostalCode 
        ORDER BY sp.SalesYTD DESC
    ) AS RowNumber,
    p.LastName,
    sp.SalesYTD,
    addr.PostalCode
FROM [Sales].[SalesPerson] sp
LEFT JOIN [Sales].[SalesTerritory] st
    ON sp.TerritoryID = st.TerritoryID
LEFT JOIN [Person].[Person] p
    ON sp.BusinessEntityID = p.BusinessEntityID
LEFT JOIN [Person].[BusinessEntityAddress] bea
    ON p.BusinessEntityID = bea.BusinessEntityID
LEFT JOIN [Person].[Address] addr
    ON addr.AddressID = bea.AddressID
WHERE sp.TerritoryID IS NOT NULL 
  AND sp.SalesYTD <> 0
ORDER BY addr.PostalCode ASC, RowNumber ASC;





--22) 
SELECT bec.ContactTypeID, ct.Name, COUNT(*) AS NoContacts
FROM [Person].[BusinessEntityContact] bec
JOIN [Person].[ContactType] ct
ON bec.ContactTypeID = ct.ContactTypeID
GROUP BY bec.ContactTypeID, ct.Name
HAVING COUNT(*) >= 100
ORDER BY NoContacts DESC;


--23)
SELECT CONVERT(date, eph.RateChangeDate) AS fromdate, --removing the time part
CONCAT(p.LastName, ' ',p.FirstName,CASE WHEN p.MiddleName IS NOT NULL THEN ' ' + p.MiddleName ELSE '' END) AS nameinfull, --we must nod an extra space if the middle name is null
eph.Rate * 40 AS salaryinaweek
FROM [HumanResources].[EmployeePayHistory]  eph
JOIN [Person].[Person]   p
ON eph.BusinessEntityID = p.BusinessEntityID
ORDER BY NameInFull ASC;

--24)
SELECT CONVERT(date, eph.RateChangeDate) AS fromdate, --removing the time part
CONCAT(p.LastName, ' ',p.FirstName,CASE WHEN p.MiddleName IS NOT NULL THEN ' ' + p.MiddleName ELSE '' END) AS nameinfull, --we must nod an extra space if the middle name is null
eph.Rate * 40 AS salaryinaweek
FROM [HumanResources].[EmployeePayHistory]  eph
JOIN [Person].[Person]   p
ON eph.BusinessEntityID = p.BusinessEntityID
ORDER BY NameInFull ASC;


--25)
SELECT SalesOrderID,ProductID,OrderQty,
SUM(OrderQty) OVER (PARTITION BY SalesOrderID) AS TotalOrderQty,
AVG(OrderQty) OVER (PARTITION BY SalesOrderID) AS AvgOrderQty,
COUNT(OrderQty) OVER (PARTITION BY SalesOrderID) AS CountOrderQty,
MAX(OrderQty) OVER (PARTITION BY SalesOrderID) AS MaxOrderQty,
MIN(OrderQty) OVER (PARTITION BY SalesOrderID) AS MinOrderQty
FROM [Sales].[SalesOrderDetail]
WHERE SalesOrderID=43659 OR SalesOrderID=43664
ORDER BY SalesOrderID, ProductID;




