-- Create a stored procedure named 'NameEmployees'
create proc NameEmployees as
begin
    -- Select three columns: EmployeeNumber, EmployeeFirstName, and EmployeeLastName
    -- from the table called 'tblEmployee'
	select EmployeeNumber, EmployeeFirstName, EmployeeLastName
	from tblEmployee

    end
go 

-- These next lines attempt to run the stored procedure,

NameEmployees  --This always has to go under a go statement

execute NameEmployees  
-- This is the correct way to execute the stored procedure.
-- It will run the code inside the 'NameEmployees' procedure and return the employee names.

exec NameEmployees  
--  This is a shorter but valid alternative to 'execute NameEmployees'.
-- It does the same thing and is commonly used.
