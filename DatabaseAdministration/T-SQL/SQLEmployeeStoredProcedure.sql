--if exists (select * from sys.procedures where name='NameEmployees')
-- Check if the stored procedure 'NameEmployees' exists in the database
-- 'P' stands for 'Procedure' in the object type
if object_ID('NameEmployees','P') IS NOT NULL -- we do this so that we dont get errors or duplications
    -- If it exists, drop (delete) it
    drop proc NameEmployees
go  -- End of batch

-- Create a new stored procedure named 'NameEmployees' that accepts one input: @EmployeeNumber
create proc NameEmployees(@EmployeeNumber int) as -- we want a specific employee
begin
    -- Check if a row with the given EmployeeNumber exists in the tblEmployee table
	if exists (Select * from tblEmployee where EmployeeNumber = @EmployeeNumber)
	begin
        -- If it exists, select and return the employee's number, first name, and last name
		select EmployeeNumber, EmployeeFirstName, EmployeeLastName
		from tblEmployee
		where EmployeeNumber = @EmployeeNumber
	end
    -- If it doesn't exist, nothing is returned
end
go  -- End of batch

--where EmployeeNumber = @EmployeeNumber:
--We are only looking for rows where the EmployeeNumber column matches the value stored in the variable @EmployeeNumber.
NameEmployees 4--not in this list so nothing will output
execute NameEmployees 223
exec NameEmployees 323
--select EmployeeNumber from NameEmployees

--DECLARE @EmployeeName int = 123
--select @EmployeeName
