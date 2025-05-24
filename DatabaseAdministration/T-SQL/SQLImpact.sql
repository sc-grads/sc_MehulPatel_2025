impact of scalar UDFs
-- Enable display of time statistics for query execution
-- Helps measure how long queries take to run
--set statistics time on

-- Create a scalar user-defined function that calculates total transaction amount for an employee
CREATE FUNCTION fnc_TransactionTotal (@intEmployee as int)
returns money
as
begin
    -- Declare a variable to hold the total amount of transactions for the employee
    declare @TotalAmount as money

    -- Calculate the sum of Amounts from tblTransaction for the given EmployeeNumber
    select @TotalAmount = sum(Amount)
    from [dbo].[tblTransaction]
    where EmployeeNumber = @intEmployee

    -- Return the total amount
    return @TotalAmount
end

-- Enable detailed showplan output for all subsequent statements
-- This displays query execution plans for analysis
set showplan_all on
go

-- Enable text-based showplan output
set showplan_text on
go

-- Select EmployeeNumber and the total transaction amount by calling the scalar function for each employee
select [EmployeeNumber], dbo.fnc_TransactionTotal([EmployeeNumber])
from [dbo].[tblEmployee]

-- Select EmployeeNumber and total transaction amount by using a LEFT JOIN and GROUP BY
-- This is a set-based approach that sums amounts per employee efficiently
select E.[EmployeeNumber], sum(Amount) as TotalAmount
from [dbo].[tblEmployee] as E
left join [dbo].[tblTransaction] as T
on E.EmployeeNumber = T.EmployeeNumber
group by E.[EmployeeNumber]

-- Disable time statistics collection
set statistics time off

-- Disable showplan_all to stop displaying execution plans
set showplan_all off

-- Select EmployeeNumber and total transaction amount by calling the scalar function again
select EmployeeNumber, dbo.fnc_TransactionTotal(EmployeeNumber)
from dbo.tblEmployee

-- Repeat the set-based aggregation with LEFT JOIN and GROUP BY
select E.EmployeeNumber, sum(T.Amount) as TotalAmount
from dbo.tblEmployee as E
left join dbo.tblTransaction as T
on E.EmployeeNumber = T.EmployeeNumber
group by E.EmployeeNumber

-- Another set-based approach: Select EmployeeNumber and a correlated subquery summing transactions for each employee
select E.EmployeeNumber, (select sum(Amount) from tblTransaction as T
where T.EmployeeNumber = E.EmployeeNumber) as TotalAmount
from dbo.tblEmployee as E
