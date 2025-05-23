-- Select all columns from the result of a LEFT JOIN between tblTransaction and a filtered subquery on tblEmployee
select * 
from tblTransaction as T
-- Perform a LEFT JOIN with a derived table (subquery) that filters tblEmployee by last names starting with 'y'
left join (select * from tblEmployee
           where EmployeeLastName like 'y%') as E
-- Match records where EmployeeNumber from both tables is the same
on E.EmployeeNumber = T.EmployeeNumber
-- Order the final result by EmployeeNumber from tblTransaction
order by T.EmployeeNumber

-- Select all columns from the result of a LEFT JOIN between tblTransaction and tblEmployee
select * 
from tblTransaction as T
-- Perform a standard LEFT JOIN between tblTransaction and tblEmployee
left join tblEmployee as E
on E.EmployeeNumber = T.EmployeeNumber
-- Filter rows where EmployeeLastName starts with 'y'
Where E.EmployeeLastName like 'y%'
-- Order the result by EmployeeNumber from tblTransaction
order by T.EmployeeNumber

-- Select all columns from the result of a LEFT JOIN with a join condition including a filter on last name
select * 
from tblTransaction as T
-- Perform a LEFT JOIN where the join condition includes a filter on EmployeeLastName
left join tblEmployee as E
on E.EmployeeNumber = T.EmployeeNumber
   and E.EmployeeLastName like 'y%'
-- Order the final result by EmployeeNumber from tblTransaction
order by T.EmployeeNumber
