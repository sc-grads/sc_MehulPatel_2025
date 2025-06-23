-- Check if a procedure named 'AverageBalance' exists and drop it if it does
-- First method (commented out) uses sys.procedures
-- Second method (active) uses OBJECT_ID
IF OBJECT_ID('AverageBalance','P') IS NOT NULL
    DROP PROC AverageBalance  -- Remove the existing procedure to allow re-creation
GO

-- Create a new stored procedure named 'AverageBalance'
CREATE PROC AverageBalance (
    @EmployeeNumberFrom INT,           -- Starting employee number
    @EmployeeNumberTo INT,             -- Ending employee number
    @AverageBalance INT OUTPUT         -- Output parameter to store the result
)
AS
BEGIN
    SET NOCOUNT ON  -- Suppress the message that shows the number of rows affected by a T-SQL statement

    -- Declare variables to store intermediate results
    DECLARE @TotalAmount DECIMAL(5,2)      -- Sum of transaction amounts
    DECLARE @NumOfEmployee INT             -- Number of distinct employees in the given range

    BEGIN TRY  -- Begin error-handling block
        -- Print the range of employee numbers for logging/debugging
        PRINT 'The employee numbers are from ' 
              + CONVERT(VARCHAR(10), @EmployeeNumberFrom) 
              + ' to ' 
              + CONVERT(VARCHAR(10), @EmployeeNumberTo)

        -- Calculate the total amount of transactions for the specified employee number range
        SELECT @TotalAmount = SUM(Amount) 
        FROM tblTransaction 
        WHERE EmployeeNumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo

        -- Count the number of distinct employees in the given range
        SELECT @NumOfEmployee = COUNT(DISTINCT EmployeeNumber) 
        FROM tblEmployee 
        WHERE EmployeeNumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo

        -- Calculate the average balance and assign it to the output parameter
        SET @AverageBalance = @TotalAmount / @NumOfEmployee

        RETURN 0  -- Successful execution
    END TRY
    BEGIN CATCH  -- Error handling block
        SET @AverageBalance = 0  -- Default value if an error occurs

        -- Handle divide by zero error specifically (error number 8134)
        IF ERROR_NUMBER() = 8134
        BEGIN
            SET @AverageBalance = 0
            PRINT 'There are no valid employees in this range.'  -- Inform the user
            RETURN 8134  -- Return specific error code
        END
        ELSE
        BEGIN
            -- For other errors, capture and raise the error message
            DECLARE @ErrorMessage AS VARCHAR(255)
            SELECT @ErrorMessage = ERROR_MESSAGE()
            RAISERROR (@ErrorMessage, 16, 1)  -- Raise an error with severity 16
        END

        -- Optional debug message - would be returned to the caller
        SELECT 'Hi There'
    END CATCH
END
GO

-- Test the procedure: Example 1 - Normal execution
DECLARE @AvgBalance INT, @ReturnStatus INT
EXEC @ReturnStatus = AverageBalance 4, 5, @AvgBalance OUTPUT
SELECT @AvgBalance AS Average_Balance, @ReturnStatus AS Return_Status
-- This block tests the procedure with a valid range and prints the output balance and status
GO

-- Test the procedure: Example 2 - Possibly invalid range
DECLARE @AvgBalance INT, @ReturnStatus INT
EXECUTE @ReturnStatus = AverageBalance 223, 227, @AvgBalance OUTPUT
SELECT @AvgBalance AS Average_Balance, 
       @ReturnStatus AS Return_Status, 
       'Error did not stop us' AS myMessage
-- Tests error handling when no valid employee exists in the range; checks robustness
GO

-- Test the procedure: Example 3 - Named parameters
DECLARE @AvgBalance INT, @ReturnStatus INT
EXEC @ReturnStatus = AverageBalance 
    @EmployeeNumberFrom = 323, 
    @EmployeeNumberTo = 327, 
    @AverageBalance = @AvgBalance OUTPUT
SELECT @AvgBalance AS Average_Balance, 
       @ReturnStatus AS Return_Status
-- Tests use of named parameters for clarity and flexibility
