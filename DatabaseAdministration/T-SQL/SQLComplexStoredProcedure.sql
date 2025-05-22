-- Check if a stored procedure named 'NameEmployees' already exists in the database
if object_ID('NameEmployees', 'P') IS NOT NULL
    -- If it exists, delete (drop) it so we can create a new version
    drop proc NameEmployees  
go  

-- Create a new stored procedure called 'NameEmployees' that takes one input parameter '@EmployeeNumber' of type integer
create proc NameEmployees(@EmployeeNumber int)
as
begin
    -- Check if there is at least one record in the 'tblEmployee' table
    -- where the EmployeeNumber matches the input parameter '@EmployeeNumber'
    if exists (select * from tblEmployee where EmployeeNumber = @EmployeeNumber)
    begin
        -- If the employee exists, then check if the EmployeeNumber is less than 300
        if @EmployeeNumber < 300
        begin
            -- For EmployeeNumbers less than 300, return only basic employee information:
            -- EmployeeNumber, EmployeeFirstName, and EmployeeLastName
            select 
                EmployeeNumber, 
                EmployeeFirstName, 
                EmployeeLastName
            from tblEmployee
            where EmployeeNumber = @EmployeeNumber
        end
        else
        begin
            -- For EmployeeNumbers 300 or higher, return more detailed employee information including the Department
            select 
                EmployeeNumber, 
                EmployeeFirstName, 
                EmployeeLastName, 
                Department
            from tblEmployee
            where EmployeeNumber = @EmployeeNumber

            -- Additionally, return all transaction records related to this employee from the 'tblTransaction' table
            select *
            from tblTransaction
            where EmployeeNumber = @EmployeeNumber
        end
    end
    else
    begin
        -- If no employee with the specified EmployeeNumber exists,
        -- output a message saying 'Employee not found.'
        print 'Employee not found.'
    end
end
go  -- End of the procedure creation batch

exec NameEmployees 4

-- Retrieve employee details for employee number 223 (basic info)
execute NameEmployees 223

-- Retrieve detailed employee info and transactions for employee number 324
exec NameEmployees 324