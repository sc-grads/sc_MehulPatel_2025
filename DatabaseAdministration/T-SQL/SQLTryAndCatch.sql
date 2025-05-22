-- Step 1: Check if the procedure already exists and drop it if it does
IF OBJECT_ID('AverageBalance', 'P') IS NOT NULL
    DROP PROC AverageBalance  -- Delete the existing version to avoid conflicts
GO  -- End of batch

-- Step 2: Create a new stored procedure
CREATE PROC AverageBalance
(
    @EmployeeNumberFrom INT,             -- Input: Start of the employee number range
    @EmployeeNumberTo INT,               -- Input: End of the employee number range
    @AverageBalance INT OUTPUT           -- Output: Will return the calculated average balance
)
AS
BEGIN
    -- Step 3: Turn off the default behavior of returning row counts after each statement
    SET NOCOUNT ON

    -- Step 4: Declare local variables used in the procedure
    DECLARE @TotalAmount MONEY           -- Will store the sum of transaction amounts
    DECLARE @NumOfEmployee INT           -- Will store how many unique employees are in the range

    -- Step 5: Begin the TRY block to safely execute potentially error-prone code
    BEGIN TRY

        -- Step 6: Calculate the total amount of all transactions for employees in the range
        SELECT @TotalAmount = SUM(Amount)
        FROM tblTransaction
        WHERE EmployeeNumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo

        -- Step 7: Count the number of unique employees in the given range
        SELECT @NumOfEmployee = COUNT(DISTINCT EmployeeNumber)
        FROM tblEmployee
        WHERE EmployeeNumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo

        -- Step 8: Calculate the average balance by dividing total by count
        -- NOTE: SQL Server will throw an error if @NumOfEmployee is 0 (division by zero),
        -- which is why this calculation is inside the TRY block.
        SET @AverageBalance = @TotalAmount / @NumOfEmployee

        -- Step 9: Return 0 to indicate the procedure executed successfully
        RETURN 0
    END TRY

    -- Step 10: If any error occurs in the TRY block, control will jump here
    BEGIN CATCH

        -- Step 11: Set the output average balance to 0 to show failure
        SET @AverageBalance = 0

        -- Step 12: Return detailed error information to help with debugging
        SELECT 
            ERROR_MESSAGE()   AS ErrorMessage,     -- Text of the error message
            ERROR_LINE()      AS ErrorLine,        -- Line number where the error happened
            ERROR_NUMBER()    AS ErrorNumber,      -- Error number/code
            ERROR_PROCEDURE() AS ErrorProcedure,   -- Name of the stored procedure
            ERROR_SEVERITY()  AS ErrorSeverity,    -- How severe the error is (0–25)
            ERROR_STATE()     AS ErrorState        -- State for the error (used for debugging)

        -- Step 13: Return 1 to indicate failure
        RETURN 1
    END CATCH
END
GO  -- End of the procedure definition


DECLARE @AvgBalance int, @ReturnStatus int
EXEC @ReturnStatus = AverageBalance 4, 5, @AvgBalance OUTPUT
select @AvgBalance as Average_Balance, @ReturnStatus as Return_Status
GO
DECLARE @AvgBalance int, @ReturnStatus int
execute @ReturnStatus = AverageBalance 223, 227, @AvgBalance OUTPUT
select @AvgBalance as Average_Balance, @ReturnStatus as Return_Status
GO
DECLARE @AvgBalance int, @ReturnStatus int
exec @ReturnStatus = AverageBalance @EmployeeNumberFrom = 323, @EmployeeNumberTo = 327, @AverageBalance = @AvgBalance OUTPUT
select @AvgBalance as Average_Balance, @ReturnStatus as Return_Status

SELECT TRY_CONVERT(int, 'two')
