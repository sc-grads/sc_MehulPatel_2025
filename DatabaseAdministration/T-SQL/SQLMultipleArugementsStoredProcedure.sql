-- STEP 1: Check if the stored procedure 'NameEmployees' already exists in the database.
-- 'P' stands for 'Procedure' (we're checking for a stored procedure object).
if object_ID('NameEmployees','P') IS NOT NULL
    -- If it exists, delete (drop) the existing procedure.
    drop proc NameEmployees
go  

-- STEP 2: Create a new stored procedure called 'NameEmployees'
-- It accepts two input parameters:
--   @EmployeeNumberFrom: the lower boundary of the employee number range
--   @EmployeeNumberTo: the upper boundary of the employee number range
create proc NameEmployees(@EmployeeNumberFrom int, @EmployeeNumberTo int )  -- Start and end of the employee number range
     
as
begin
    -- STEP 3: Check if there are any employees in the 'tblEmployee' table
    -- whose EmployeeNumber is within the specified range (inclusive).
    if exists (select * from tblEmployee where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo)
    begin
        -- STEP 4: If matching employees exist, retrieve their information.
        -- Only selecting EmployeeNumber, FirstName, and LastName.
        select 
            EmployeeNumber, 
            EmployeeFirstName, 
            EmployeeLastName
        from tblEmployee
        where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo
    end
    -- STEP 5 (optional): If no employee is found in the given range, nothing is returned.
    -- You could add an ELSE block here to show a message like: PRINT 'No employees found.'
end
go  -- End of procedure creation batch
