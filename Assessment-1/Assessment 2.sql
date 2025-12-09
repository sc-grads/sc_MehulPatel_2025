--26)
SELECT SalesOrderID AS ordernumber,ProductID, OrderQty,
SUM(OrderQty) As Total ,
AVG(OrderQty) As Avg,
COUNT(OrderQty) As Count  
FROM [Sales].[SalesOrderDetail]
WHERE [SalesOrderID] In (43659, 43664) AND [ProductID] LIKE '71%'
GROUP BY SalesOrderID, ProductID , OrderQty


--27)
SELECT [SalesOrderID],SUM([UnitPrice]*[OrderQty]) AS orderidcost
FROM [Sales].[SalesOrderDetail]
GROUP BY [SalesOrderID]
HAVING SUM([UnitPrice]*[OrderQty]) > 100000

--28)
SELECT ProductID,Name
FROM [Production].[Product]
WHERE Name LIKE 'Lock Washer%'
ORDER BY ProductID ASC;

--29)
SELECT ProductID,Name,Color
FROM [Production].[Product]
ORDER BY ListPrice;

--30)
SELECT BusinessEntityID, JobTitle, HireDate
FROM [HumanResources].[Employee] 
ORDER BY YEAR(HireDate)

--31)
SELECT LastName, FirstName
FROM [Person].[Person]
WHERE LastName Like 'R%'
ORDER BY FirstName ASC, LastName DESC

--32)
SELECT BusinessEntityID, IIF(SalariedFlag = 1,  'true', 'false') AS salariedflag
FROM [HumanResources].[Employee] 
ORDER BY salariedflag ASC, BusinessEntityID ASC

--33)



--34)


--35)
SELECT DepartmentID,Name,GroupName
FROM [HumanResources].[Department]
ORDER BY DepartmentID
OFFSET 10 ROWS  

--36)
SELECT DepartmentID,Name,GroupName
FROM [HumanResources].[Department]
ORDER BY DepartmentID
OFFSET 5 ROWS
FETCH NEXT 5 ROWS ONLY

--37)
SELECT Name,Color,ListPrice
FROM [Production].[Product]
WHERE Color = 'Blue' or Color= 'Red'
ORDER BY ListPrice ASC

--38)
WITH OrderedProducts AS  --creating a temp table
(
    SELECT P.Name AS name,sod.SalesOrderID,ROW_NUMBER() OVER (ORDER BY p.Name) AS RowNum
    FROM [Production].[Product]  p 
    FULL OUTER JOIN [Sales].[SalesOrderDetail] sod
    ON p.ProductID = sod.ProductID
)
SELECT name, salesorderid
FROM OrderedProducts
WHERE RowNum = 1 OR RowNum > 236 
ORDER BY name

--39)
WITH OrderedProducts AS  --creating a temp table
(
    SELECT P.Name AS name,sod.SalesOrderID,ROW_NUMBER() OVER (ORDER BY p.Name) AS RowNum
    FROM [Production].[Product]  p 
    FULL OUTER JOIN [Sales].[SalesOrderDetail] sod
    ON p.ProductID = sod.ProductID
)
SELECT name, salesorderid
FROM OrderedProducts
WHERE RowNum = 1 OR RowNum > 236 
ORDER BY name

--40)
SELECT P.Name AS name,sod.SalesOrderID
FROM [Production].[Product]  p 
FULL OUTER JOIN [Sales].[SalesOrderDetail] sod
ON p.ProductID = sod.ProductID
ORDER BY name

--41)
SELECT t.Name AS TerritoryName,sp.BusinessEntityID
FROM [Sales].[SalesPerson] sp
LEFT JOIN [Sales].[SalesTerritory] t
ON sp.TerritoryID = t.TerritoryID;

--42)
SELECT p.FirstName + ' ' + p.LastName AS name, a.City
FROM [Person].[Person] p
JOIN [Person].[BusinessEntityAddress] bea
ON p.BusinessEntityID = bea.BusinessEntityID
JOIN [Person].[Address] a
ON bea.AddressID = a.AddressID
ORDER BY p.LastName,p.FirstName;

--43)
SELECT dt.BusinessEntityID,dt.FirstName,dt.LastName
FROM (   --using a derived table to filter the data
        SELECT BusinessEntityID, FirstName, LastName
        FROM [Person].[Person]
        WHERE PersonType = 'IN' AND LastName = 'Adams'
    ) AS dt
ORDER BY dt.FirstName ASC;

--44)
SELECT BusinessEntityID,FirstName,LastName
FROM [Person].[Person]
WHERE BusinessEntityID <1500 AND LastName LIKE 'AL%' AND FirstName LIKE 'M%'
ORDER BY BusinessEntityID ASC

--45)
SELECT dt.ProductID,dt.Name,dt.Color
FROM ( select ProductID,Name,Color 
       FROM [Production].[Product]
	   WHERE Name = 'Blade' or Name = 'Crown Race' or Name = 'AWC Logo Cap'
	  ) AS dt
ORDER BY color ASC


--46)
SELECT sp.BusinessEntityID AS salespersonid, COUNT(soh.SalesOrderID) AS totalsales, YEAR(soh.OrderDate) AS salesyear
FROM Sales.SalesOrderHeader soh
JOIN Sales.SalesPerson sp
ON soh.SalesPersonID = sp.BusinessEntityID
GROUP BY YEAR(soh.OrderDate),sp.BusinessEntityID
ORDER BY sp.BusinessEntityID,YEAR(soh.OrderDate);

--47)

--48)
SELECT *
FROM Production.ProductPhoto
WHERE LargePhotoFileName LIKE '%green\_%' ESCAPE '\';

--49)



