-- Select specific columns from tblDepartment (aliased as D) joined with tblEmployee (aliased as E)
-- Use NOLOCK hint on tblDepartment to avoid locking and allow dirty reads (may read uncommitted data)
select D.Department, D.DepartmentHead, E.EmployeeNumber, E.EmployeeFirstName,
E.EmployeeLastName
from [dbo].[tblDepartment] as D WITH (NOLOCK)
left join [dbo].[tblEmployee] as E
on D.Department = E.Department
where D.Department = 'HR'

-- Same query as above but using REPEATABLEREAD hint on tblDepartment
-- REPEATABLEREAD ensures that rows read cannot be changed by others during the transaction, preventing non-repeatable reads
select D.Department, D.DepartmentHead, E.EmployeeNumber, E.EmployeeFirstName,
E.EmployeeLastName
from [dbo].[tblDepartment] as D WITH (REPEATABLEREAD)
left join [dbo].[tblEmployee] as E
on D.Department = E.Department
where D.Department = 'HR'

-- Declare a variable @param and assign the string '127' to it
DECLARE @param varchar(1000) = '127';

-- Declare a variable @sql to hold dynamic SQL statement as an nvarchar(max) string
-- The statement selects all rows from tblTransaction where EmployeeNumber equals @param (concatenated)
DECLARE @sql nvarchar(max) =
N'
SELECT *
FROM [dbo].[tblTransaction] AS T

WHERE T.EmployeeNumber = ' + @param;

-- Execute the dynamic SQL stored in @sql
EXECUTE (@sql);

-- Declare a variable @parameter with a string that includes '127' plus a newline and another SQL statement
DECLARE @parameter varchar(1000) = '127' + char(10) + 'SELECT * from dbo.tblTransaction';

-- Declare a variable @sql with dynamic SQL, concatenating the potentially unsafe @parameter
DECLARE @sql nvarchar(max) =
N'
SELECT *
FROM [dbo].[tblTransaction] AS T
WHERE T.EmployeeNumber = ' + @parameter;

-- Execute the dynamic SQL stored in @sql
EXECUTE (@sql);

-- Declare a variable @param and assign the string '127' to it
DECLARE @param varchar(1000) = '127';

-- Execute a parameterized query using sp_executesql to safely pass parameters
-- This helps avoid SQL injection and allows query plan reuse
EXECUTE sys.sp_executesql
@statement =
N'
SELECT *
FROM [dbo].[tblTransaction] AS T
WHERE T.EmployeeNumber = @EmployeeNumber;',
@params = N'@EmployeeNumber varchar(1000)',
@EmployeeNumber = @param;
