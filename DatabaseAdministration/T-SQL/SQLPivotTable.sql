-- Create a Common Table Expression (CTE) named 'myTable'
with myTable as
(
    -- Select the year and month from the DateOfTransaction column, along with the transaction Amount
    select year(DateOfTransaction) as TheYear, 
           month(DateOfTransaction) as TheMonth, 
           Amount
    from tblTransaction  -- From the transaction table
)

-- Begin the main SELECT statement
select 
    TheYear,                     -- Select the year column
    isnull([1],0) as [1],        -- Replace NULLs in January's data with 0
    isnull([2],0) as [2],        -- Replace NULLs in February's data with 0
    isnull([3],0) as [3],        -- Replace NULLs in March's data with 0
    isnull([4],0) as [4],        -- Replace NULLs in April's data with 0
    isnull([5],0) as [5],        -- Replace NULLs in May's data with 0
    isnull([6],0) as [6],        -- Replace NULLs in June's data with 0
    isnull([7],0) as [7],        -- Replace NULLs in July's data with 0
    isnull([8],0) as [8],        -- Replace NULLs in August's data with 0
    isnull([9],0) as [9],        -- Replace NULLs in September's data with 0
    isnull([10],0) as [10],      -- Replace NULLs in October's data with 0
    isnull([11],0) as [11],      -- Replace NULLs in November's data with 0
    isnull([12],0) as [12]  into tblPivot from myTable     -- Replace NULLs in December's data with 0

-- Perform the PIVOT operation on 'myTable'


-- Pivoting the data: aggregate Amount by month, turning month values into columns
PIVOT (
    sum(Amount)                  -- Aggregate function: sum of Amount
    for TheMonth in ([1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12]) 
    -- Define columns for each month
) as myPvt
