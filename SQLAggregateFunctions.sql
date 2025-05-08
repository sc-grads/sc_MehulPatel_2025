USE AdventureWorks2022

Select 
	SUM(Rate) AS SumRate,
    AVG(Rate) AS AvgRate,
    MAX(Rate) AS HigestRate,
    MIN(Rate) AS LowestRate
FROM HumanResources.EmployeePayHistory