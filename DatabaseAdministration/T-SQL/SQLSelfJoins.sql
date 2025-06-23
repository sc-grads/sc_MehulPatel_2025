-- Begin a transaction block so changes can be rolled back later
begin tran

-- Alter the table 'tblEmployee' to add a new column named 'Manager' of type int
alter table tblEmployee
add Manager int

-- 'go' signals the end of the batch and executes the previous statements
go

-- Update the 'Manager' column with a calculated value based on EmployeeNumber
update tblEmployee
set Manager = ((EmployeeNumber-123)/10)+123
-- Only update rows where EmployeeNumber is greater than 123
where EmployeeNumber > 123

-- Select employee info along with their manager's info by joining the table to itself
select 
    E.EmployeeNumber,            -- Employee's number
    E.EmployeeFirstName,         -- Employee's first name
    E.EmployeeLastName,          -- Employee's last name
    M.EmployeeNumber as ManagerNumber,       -- Manager's employee number (from joined table)
    M.EmployeeFirstName as ManagerFirstName, -- Manager's first name
    M.EmployeeLastName as ManagerLastName    -- Manager's last name

-- From 'tblEmployee' aliased as E (employees)
from tblEmployee as E

-- Left join to 'tblEmployee' again aliased as M (managers)
left JOIN tblEmployee as M
-- Join condition: employee's Manager column matches a manager's EmployeeNumber
on E.Manager = M.EmployeeNumber

-- Roll back the transaction to undo the changes made above
rollback tran
