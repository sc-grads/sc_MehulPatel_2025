--Scalar Functions 2 
-- Check if a function named 'NumberOfTransactions' of type 'FN' (scalar function) exists
if object_ID(N'NumberOfTransactions', N'FN') IS NOT NULL
    -- If the function exists, drop it to allow recreation
    DROP FUNCTION NumberOfTransactions
GO

-- Create a scalar function named 'NumberOfTransactions' that takes @EmployeeNumber as an input parameter (int)
CREATE FUNCTION NumberOfTransactions(@EmployeeNumber int)
-- The function returns an integer value
RETURNS int
AS
BEGIN
    -- Declare a variable to hold the count of transactions
    DECLARE @NumberOfTransactions INT

    -- Assign to the variable the count of rows in tblTransaction where EmployeeNumber matches input
    SELECT @NumberOfTransactions = COUNT(*) FROM tblTransaction
    WHERE EmployeeNumber = @EmployeeNumber

    -- Return the calculated count
    RETURN @NumberOfTransactions
END
