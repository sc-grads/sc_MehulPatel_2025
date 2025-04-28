SELECT * FROM Person.Address
 
SELECT addressid,city,modifieddate FROM Person.Address  
 
SELECT TOP 10 * FROM Person.Address
 
SELECT * FROM Person.Address WHERE PostalCode = '98011'
 
SELECT * FROM Person.Address WHERE PostalCode != '98011' --19588
 
SELECT * FROM Person.Address WHERE PostalCode <> '98011'
 
SELECT count(*) FROM Person.Address WHERE PostalCode <> '98011'
 
SELECT * FROM Person.Address WHERE ModifiedDate >= '2013-11-08 00:00:00.000'
 
SELECT * FROM Person.Person WHERE FirstName LIKE 'MAT%' --% it should start with MAT but we dont care what is after

select * from Person.Person where FirstName like '%ew'

SELECT * FROM [HumanResources].[EmployeePayHistory]

SELECT MAX(RATE) FROM [HumanResources].[EmployeePayHistory] 

select max(rate) AS MaxPayrate from [HumanResources].[EmployeePayHistory] -- we give the output a column name.

SELECT MIN(RATE) FROM [HumanResources].[EmployeePayHistory] 

SELECT MIN(rate) AS [Min Pay rate] from [HumanResources].[EmployeePayHistory] -- we give the output a column name.

SELECT * FROM [Production].[ProductCostHistory] where startdate = '2013-05-30 00:00:00' 

SELECT * FROM [Production].[ProductCostHistory] where startdate = '2013-05-30 00:00:00' and StandardCost >= 200

SELECT * FROM[Production].[ProductCostHistory] where( startdate = '2013-05-30 00:00:00' and StandardCost >= 200) or ProductID >800

SELECT * FROM [Production].[ProductCostHistory] where( startdate = '2013-05-30 00:00:00' and StandardCost >= 200) and ProductID >800

SELECT * FROM [Production].[ProductCostHistory] where ProductID in (802,803,820,900) -- only selects where the product ID is those values

SELECT * FROM [Production].[ProductCostHistory] where EndDate is null

SELECT * FROM[Production].[ProductCostHistory] where EndDate is not null 

SELECT * FROM [HumanResources].[EmployeePayHistory] order by rate 

SELECT * FROM [HumanResources].[EmployeePayHistory] order by rate ASC 

SELECT * FROM [HumanResources].[EmployeePayHistory] order by rate DESC

SELECT * FROM [HumanResources].[EmployeePayHistory] where ModifiedDate >= '2010-06-30 00:00:00.000' order by ModifiedDate DESC 

SELECT * FROM [HumanResources].[EmployeePayHistory] where  YEAR(ModifiedDate) >= '2014' order by ModifiedDate desc

SELECT * FROM [HumanResources].[EmployeePayHistory] where  MONTH(ModifiedDate) = '06' order by ModifiedDate desc


select * from Person.address where postalcode = '98011'


select count(*) from Person.address where postalcode = '98011'


select count(*),postalcode from Person.address group by PostalCode

select count(*) as NoOfAddresses,postalcode from Person.address group by PostalCode --for each postal code it shows the number of addresses

select count(*) as NoOfAddresses,postalcode from Person.address group by PostalCode order by PostalCode

select count(*),City from Person.address group by City

select count(*),City,PostalCode from Person.address group by City,PostalCode 

select * from Production.product

select count(*) countofproduct,Color from Production.product group by Color

select count(*) countofproduct,Color from Production.product where color = 'yellow' group by Color

select count(*) countofproduct,Color from Production.product group by Color having Color = 'yellow'

select count(*) countofproduct,Color,Size from Production.product group by Color,size having Size >= '44'