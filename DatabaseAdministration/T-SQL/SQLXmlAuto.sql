--For XML Auto 
-- Select specific columns from tblEmployee and tblTransaction tables
select E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
, E.DateOfBirth, T.Amount, T.DateOfTransaction

-- From tblEmployee aliased as E
from [dbo].[tblEmployee] as E

-- Left join tblTransaction aliased as T on matching EmployeeNumber to include all employees even if no transactions
left join [dbo].[tblTransaction] as T
on E.EmployeeNumber = T.EmployeeNumber

-- Filter to include only employees with EmployeeNumber between 200 and 202 inclusive
where E.EmployeeNumber between 200 and 202

-- Format the result set as XML using AUTO mode, which generates nested XML elements based on table relationships
-- 'elements' option formats columns as subelements rather than attributes
for xml auto, elements
