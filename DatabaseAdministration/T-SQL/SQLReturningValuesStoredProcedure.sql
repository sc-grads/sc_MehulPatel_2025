-- Step 1: Drop the stored procedure if it already exists
IF OBJECT_ID('NameEmployees', 'P') IS NOT NULL
    DROP PROC NameEmployees
GO  -- End of batch (ensures the DROP executes before CREATE)

-- Step 2: Create the stored procedure
CREATE PROC NameEmployees
(   @EmployeeNumberFrom INT,            -- Start of employee number range
    @EmployeeNumberTo INT,              -- End of employee number range
    @NumberOfRows INT OUTPUT            -- OUTPUT parameter to return row count
)
AS
BEGIN
    -- Step 3: Check if any employee exists in the given range
    IF EXISTS (SELECT *FROM tblEmployee WHERE EmployeeNumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo)
    BEGIN
        -- Step 4: Select the employees in the given range
        SELECT 
            EmployeeNumber, 
            EmployeeFirstName, 
            EmployeeLastName
        FROM tblEmployee
        WHERE EmployeeNumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo

        -- Step 5: Set the OUTPUT variable to the number of rows returned
        SET @NumberOfRows = @@ROWCOUNT --@@ROWCOUNT is a system function that automatically stores the number of rows

        -- Step 6: Return 0 to indicate success
        RETURN 0
    END
    ELSE
    BEGIN
        -- Step 7: If no employees are found, set the output to 0
        SET @NumberOfRows = 0

        -- Step 8: Return 1 to indicate no data was found
        RETURN 1
    END
END
GO  -- End of stored procedure definition



DECLARE @NumberRows int, @ReturnStatus int
EXEC @ReturnStatus = NameEmployees 4, 5, @NumberRows OUTPUT
select @NumberRows as MyRowCount, @ReturnStatus as Return_Status
GO
DECLARE @NumberRows int, @ReturnStatus int
execute @ReturnStatus = NameEmployees 4, 327, @NumberRows OUTPUT
select @NumberRows as MyRowCount, @ReturnStatus as Return_Status
GO
DECLARE @NumberRows int, @ReturnStatus int
exec @ReturnStatus = NameEmployees @EmployeeNumberFrom = 323, @EmployeeNumberTo = 327, @NumberOfRows = @NumberRows OUTPUT
select @NumberRows as MyRowCount, @ReturnStatus as Return_Status
