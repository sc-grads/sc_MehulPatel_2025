-- Select specific columns from tblEmployee and tblTransaction tables
select E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
, E.DateOfBirth, T.Amount, T.DateOfTransaction

-- From tblEmployee aliased as E
from [dbo].[tblEmployee] as E

-- Left join tblTransaction aliased as T on matching EmployeeNumber to include all employees even if no transactions
left join [dbo].[tblTransaction] as T
on E.EmployeeNumber = T.EmployeeNumber

-- Filter results for employees with EmployeeNumber between 200 and 202 inclusive
where E.EmployeeNumber between 200 and 202

-- Format the result set as XML, using RAW mode with each row wrapped in <MyRow> element
-- 'elements' option makes each column an XML element instead of attribute
for xml raw('MyRow'), elements
