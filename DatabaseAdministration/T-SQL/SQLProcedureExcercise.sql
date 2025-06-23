-- Step 1: Drop the stored procedure if it already exists
IF OBJECT_ID('AverageBalance', 'P') IS NOT NULL
    DROP PROC AverageBalance
GO  -- End of batch (ensures the DROP executes before CREATE)

-- Step 2: Create the stored procedure
CREATE PROC AverageBalance
(   @EmployeeNumberFrom INT,            -- Start of employee number range
    @EmployeeNumberTo INT,              -- End of employee number range
    @AverageBalance INT OUTPUT            -- OUTPUT parameter to return row count
)
AS
BEGIN
    declare @TotalAmount money
	declare @NumOfEmployee int
	select @TotalAmount= sum(Amount) from tblTransaction
	where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo
	select @NumOfEmployee=count(distinct EmployeeNumber) from tblEmployee
	where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo
	set @AverageBalance=@TotalAmount/@NumOfEmployee

END
GO  -- End of stored procedure definition



--DECLARE @AvgBalance int, @ReturnStatus int
--EXEC @ReturnStatus = AverageBalance 4, 5, @AvgBalance OUTPUT
--select @AvgBalance as Average_Balance, @ReturnStatus as Return_Status  -- we have an error here beacuse divsion by zero
GO
DECLARE @AvgBalance int, @ReturnStatus int
execute @ReturnStatus = AverageBalance 223, 227, @AvgBalance OUTPUT
select @AvgBalance as Average_Balance, @ReturnStatus as Return_Status
GO
DECLARE @AvgBalance int, @ReturnStatus int
exec @ReturnStatus = AverageBalance @EmployeeNumberFrom = 323, @EmployeeNumberTo = 327, @AverageBalance = @AvgBalance OUTPUT
select @AvgBalance as Average_Balance, @ReturnStatus as Return_Status
