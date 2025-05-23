-- Select all columns from the tblTransaction table and call it T
select T.* 
-- The data is coming from the tblTransaction table, and we will refer to it as T
from tblTransaction as T
-- We are joining the tblEmployee table to the transaction table
inner join tblEmployee as E
-- This is how we connect the two tables: match employees by their EmployeeNumber
on E.EmployeeNumber = T.EmployeeNumber
-- Only include employees whose last name starts with the letter 'y'
where E.EmployeeLastName like 'y%'
-- Sort the final result by EmployeeNumber
order by T.EmployeeNumber

-- Select all columns from the tblTransaction table and call it T
select * 
from tblTransaction as T
-- Only include transactions where the EmployeeNumber appears in the subquery result
Where EmployeeNumber in
    (
    -- Subquery: get EmployeeNumbers for employees whose last name starts with 'y'
    Select EmployeeNumber 
    from tblEmployee 
    where EmployeeLastName like 'y%'
    )
-- Sort the final result by EmployeeNumber
order by EmployeeNumber
