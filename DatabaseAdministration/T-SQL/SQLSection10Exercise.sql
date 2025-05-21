
select datename(month,DateOfBirth) as MonthName, count(*) as NumberEmployees,
COUNT(EmployeeMiddleName) as NumberOfMiddleNames,
count(*)-count(EmployeeMiddleName) as NoMiddleName,
format(min(DateOfBirth),'dd-MM-yy') as EarliestDateOfBirth,
format(max(DateOfBirth),'D') as LatestDateOfBirth
FROM tblEmployee
GROUP BY DATENAME(MONTH,DateOfBirth), DATEPART(MONTH,DateOfBirth)
ORDER BY DATEPART(MONTH,DateOfBirth)

--DATENAME(month, DateOfBirth) as MonthName:
--Extracts the name of the month (like 'January', 'February', etc.) from the DateOfBirth.

--COUNT(*) as NumberEmployees:
--Counts all employees born in each month.

--COUNT(EmployeeMiddleName) as NumberOfMiddleNames:
--Counts how many employees have a non-NULL middle name for each birth month.

--COUNT(*) - COUNT(EmployeeMiddleName) as NoMiddleName:
--Calculates the number of employees without a middle name by subtracting the count of those who have one from the total.

--FORMAT(MIN(DateOfBirth), 'dd-MM-yy') as EarliestDateOfBirth:
--Finds the earliest date of birth in that month group and formats it as dd-MM-yy.

--FORMAT(MAX(DateOfBirth), 'D') as LatestDateOfBirth:
--Finds the latest date of birth in that month group and formats it using the long date format (e.g., "Tuesday, May 21, 2024").

