-- Select all columns from tblTransaction
select * 
from tblTransaction as T
-- Filter only those transactions where a corresponding employee exists whose last name starts with 'y'
Where exists 
    (Select EmployeeNumber 
     from tblEmployee as E 
     where EmployeeLastName like 'y%' 
       and T.EmployeeNumber = E.EmployeeNumber)
-- Sort the results by EmployeeNumber
order by EmployeeNumber

-- Select all columns from tblTransaction
select * 
from tblTransaction as T
-- Filter only those transactions where NO corresponding employee exists whose last name starts with 'y'
Where not exists 
    (Select EmployeeNumber 
     from tblEmployee as E 
     where EmployeeLastName like 'y%' 
       and T.EmployeeNumber = E.EmployeeNumber)
-- Sort the results by EmployeeNumber
order by EmployeeNumber
