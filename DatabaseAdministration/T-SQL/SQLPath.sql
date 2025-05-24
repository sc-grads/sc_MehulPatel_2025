--For XML Path 
-- Select EmployeeFirstName and map it as an XML attribute '@EmployeeFirstName'
select E.EmployeeFirstName as '@EmployeeFirstName'
-- Select EmployeeLastName and map it as an XML attribute '@EmployeeLastName'
, E.EmployeeLastName as '@EmployeeLastName'
-- Select EmployeeNumber as an XML element (default behavior)
, E.EmployeeNumber
-- Select DateOfBirth as an XML element
, E.DateOfBirth
-- Select Amount from tblTransaction, placing it under a nested 'Transaction' element as 'Amount'
, T.Amount as 'Transaction/Amount'
-- Select DateOfTransaction from tblTransaction, placing it under 'Transaction' element as 'DateOfTransaction#' (the '#' prevents escaping special characters)
, T.DateOfTransaction as 'Transaction/DateOfTransaction#'

-- From the tblEmployee table aliased as E
from [dbo].[tblEmployee] as E

-- Left join to tblTransaction aliased as T, matching EmployeeNumber, so employees without transactions are included
left join [dbo].[tblTransaction] as T
on E.EmployeeNumber = T.EmployeeNumber

-- Filter employees to only those with EmployeeNumber between 200 and 202 inclusive
where E.EmployeeNumber between 200 and 202

-- Format the output as XML using PATH mode:
-- 'Employees' is the element name for each row
-- 'ROOT' specifies the root element name for the entire XML output as 'MyXML'
for xml path('Employees'), ROOT('MyXML')
