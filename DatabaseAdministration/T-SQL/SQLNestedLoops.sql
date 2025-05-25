-- Select specific columns from a LEFT JOIN between tblDepartment and tblEmployee
-- This query filters by Department = 'HR', which reduces the number of outer rows
-- When the outer result set (from tblDepartment) is small, SQL Server may use a Nested Loop Join
-- A Nested Loop Join is efficient for small input sets or when indexes are available on the inner table
select D.Department, D.DepartmentHead, E.EmployeeNumber, E.EmployeeFirstName,
E.EmployeeLastName
from [dbo].[tblDepartment] as D
left join [dbo].[tblEmployee] as E
on D.Department = E.Department
where D.Department = 'HR'

-- Perform a LEFT JOIN between tblEmployee and tblTransaction
-- All records from tblEmployee are returned, and matched records from tblTransaction
-- If no match exists, transaction columns will be NULL
-- SQL Server may use a Nested Loop Join if indexes on EmployeeNumber exist and row counts are suitable
select *
from [dbo].[tblEmployee] as E
left join [dbo].[tblTransaction] as T
on E.EmployeeNumber = T.EmployeeNumber

-- Select specific columns (EmployeeNumber and Amount) from the LEFT JOIN of tblEmployee and tblTransaction
-- Again, this type of join could use a Nested Loop Join if the optimizer finds it efficient
select E.EmployeeNumber, T.Amount
from [dbo].[tblEmployee] as E
left join [dbo].[tblTransaction] as T
on E.EmployeeNumber = T.EmployeeNumber
