--43. Schema

-- Select EmployeeNumber, EmployeeFirstName, and EmployeeLastName from the tblEmployee table (aliased as E)

-- Also select the Amount and DateOfTransaction from the tblTransaction table (aliased as T)

select E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName

, T.Amount, T.DateOfTransaction


-- Perform a LEFT JOIN between tblEmployee and tblTransaction on EmployeeNumber

-- This ensures that all employees between 200 and 202 are returned, even if they have no matching transactions

from [dbo].[tblEmployee] as E

left join [dbo].[tblTransaction] as T

on E.EmployeeNumber = T.EmployeeNumber


-- Filter results to only include employees with EmployeeNumber between 200 and 202

where E.EmployeeNumber between 200 and 202


-- Output the results as XML using RAW mode, and include the XML Schema (XSD) that describes the structure of the XML

for xml raw, xmlschema --, xmldata