-- CTE: Generate a list of row numbers from 1 to the maximum EmployeeNumber found in the tblTransaction table.
with Numbers as (
    select top (
        select max(EmployeeNumber) 
        from tblTransaction
    ) 
    row_number() over(order by (select null)) as RowNumber
    from tblTransaction as U
),

-- CTE: Select all transactions that occurred in the year 2014 only.
Transactions2014 as (
    select * 
    from tblTransaction 
    where DateOfTransaction >= '2014-01-01' 
      and DateOfTransaction < '2015-01-01'
),

-- CTE: Find EmployeeNumbers (from 1 to max) that have no transactions in 2014, i.e., gaps in activity.
tblGap as (
    select 
        U.RowNumber,  -- A possible EmployeeNumber
        RowNumber - LAG(RowNumber) over(order by RowNumber) as PreviousRowNumber, -- Difference from previous row
        LEAD(RowNumber) over(order by RowNumber) - RowNumber as NextRowNumber,    -- Difference to next row
        -- Flag whether this row starts a new gap group (1 = yes, 0 = no)
        case 
            when RowNumber - LAG(RowNumber) over(order by RowNumber) = 1 
            then 0 
            else 1 
        end as GroupGap
    from Numbers as U
    left join Transactions2014 as T
        on U.RowNumber = T.EmployeeNumber  -- Only join where the employee had a 2014 transaction
    where T.EmployeeNumber is null         -- We are interested in those that had no 2014 transactions
),

-- CTE: Assign a "group number" to each gap group using a running total of the GroupGap flag.
tblGroup as (
    select *, 
        sum(GroupGap) over (ORDER BY RowNumber) as TheGroup  -- Create a group number by cumulative sum
    from tblGap
)

-- Final query: For each group of consecutive missing EmployeeNumbers, find the start and end of the gap,
-- and count how many EmployeeNumbers are in that gap.
select 
    Min(RowNumber) as StartingEmployeeNumber, 
    Max(RowNumber) as EndingEmployeeNumber,
    Max(RowNumber) - Min(RowNumber) + 1 as NumberEmployees
from tblGroup
group by TheGroup
order by TheGroup;
