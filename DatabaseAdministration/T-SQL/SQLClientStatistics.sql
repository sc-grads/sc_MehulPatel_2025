-- Select all columns from the tblEmployee table with an alias 'E'
-- This query will result in a Table Scan because no filtering condition is provided
select *
from [dbo].[tblEmployee] as E
-- Table Scan

-- Select all columns from the tblEmployee table where EmployeeNumber = 134
-- This still results in a Table Scan if there is no index on EmployeeNumber,
-- or if the query is not optimized to use an existing index
select *
from [dbo].[tblEmployee] as E
where E.EmployeeNumber = 134
-- Still a Table Scan
