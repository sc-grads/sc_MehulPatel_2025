-- STEP 1: Check if the stored procedure already exists
-- 'P' stands for a stored procedure object in the database
if object_ID('NameEmployees','P') IS NOT NULL
    drop proc NameEmployees  -- If it exists, delete the old version
go  -- End of batch, ensures the DROP executes before CREATE

-- STEP 2: Create the stored procedure
-- Accepts two input parameters:
--   @EmployeeNumberFrom: the starting EmployeeNumber
--   @EmployeeNumberTo: the ending EmployeeNumber
create proc NameEmployees(
    @EmployeeNumberFrom int,
    @EmployeeNumberTo int
)
as
begin
    -- STEP 3: Check if at least one employee exists within the provided range
    if exists (select * from tblEmployee where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo )
    begin
        -- STEP 4: Declare a local variable to use as a counter in the WHILE loop
        declare @EmployeeNumber int = @EmployeeNumberFrom --declaring a new variable wehich will store the current number.

        -- STEP 5: Loop from @EmployeeNumberFrom to @EmployeeNumberTo
        while @EmployeeNumber <= @EmployeeNumberTo
        begin
            -- STEP 6: Check if an employee exists with the current EmployeeNumber
            if exists (select * from tblEmployee where EmployeeNumber = @EmployeeNumber)
            begin
                -- STEP 7: If the employee exists, select and display their details
                select 
                    EmployeeNumber, 
                    EmployeeFirstName, 
                    EmployeeLastName
                from tblEmployee
                where EmployeeNumber = @EmployeeNumber
            end

            -- STEP 8: Increment the counter to move to the next employee number
            set @EmployeeNumber = @EmployeeNumber + 1
        end
    end
    -- If no employee in the range exists at all, nothing is returned.
end
go  -- End of procedure definition batch


NameEmployees 4, 5
execute NameEmployees 223, 227
exec NameEmployees @EmployeeNumberFrom = 323, @EmployeeNumberTo = 1327
