--35. For XML Explicit 
-- Select rows with Tag=1 indicating the parent element level, Parent=NULL since it's the root
select 1 as Tag, NULL as Parent

-- Select EmployeeFirstName mapped as an XML element under the 'Elements' tag, level 1
, E.EmployeeFirstName as [Elements!1!EmployeeFirstName]

-- Select EmployeeLastName mapped as an XML element under 'Elements', level 1
, E.EmployeeLastName as [Elements!1!EmployeeLastName]

-- Select EmployeeNumber as an XML element under 'Elements', level 1
, E.EmployeeNumber as [Elements!1!EmployeeNumber]

-- Select DateOfBirth as an XML element under 'Elements', level 1
, E.DateOfBirth as [Elements!1!DateOfBirth]

-- For the child tag level 2, Amount is null in the parent row
, null as [Elements!2!Amount]

-- For the child tag level 2, DateOfTransaction is null in the parent row
, null as [Elements!2!DateOfTransaction]

-- From the tblEmployee table aliased as E
from [dbo].[tblEmployee] as E

-- Filter employees with EmployeeNumber between 200 and 202
where E.EmployeeNumber between 200 and 202

-- Combine with child element rows with Tag=2 and Parent=1 indicating these are children of Tag=1 rows
union all

-- Select child tag rows with Tag=2 and Parent=1 linking to parent rows
select 2 as Tag, 1 as Parent

-- Null for parent-level employee elements in child rows
, null as [EmployeeFirstName]

, null as [EmployeeLastName]

-- EmployeeNumber included in child rows for join and hierarchy
, T.EmployeeNumber

-- Null for DateOfBirth in child rows
, null as DateOfBirth

-- Amount from tblTransaction as child element level 2
, Amount

-- DateOfTransaction from tblTransaction as child element level 2
, DateOfTransaction

-- From tblTransaction aliased as T
from [dbo].[tblTransaction] as T

-- Join to tblEmployee to ensure child transactions correspond to employees filtered in parent rows
inner join [dbo].[tblEmployee] as E on T.EmployeeNumber = E.EmployeeNumber

-- Filter transactions to those with EmployeeNumber between 200 and 202 inclusive
where T.EmployeeNumber between 200 and 202

-- Order results by EmployeeNumber and then Amount (under the child elements)
order by EmployeeNumber, [Elements!2!Amount]

-- Format the results as XML using EXPLICIT mode, which uses Tag and Parent to define hierarchy and XML structure explicitly
for xml explicit
