SELECT * FROM [Person].[Person]

SELECT BusinessEntityID,FirstName,LastName,Title FROM [Person].[Person] WHERE Title = 'Mr.'
 
SELECT BusinessEntityID,FirstName,LastName,Title 
into #TempPersonTable
FROM [Person].[Person] 
WHERE Title = 'Mr.'

SELECT * FROM #TempPersonTable

DROP TABLE #TempPersonTable 

CREATE TABLE #TempPersonTable (
BusinessEntityID INT,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Title VARCHAR(50)
) 

INSERT INTO #TempPersonTable 
SELECT BusinessEntityID,FirstName,LastName,Title 
FROM [Person].[Person] 
WHERE Title = 'Mr.'