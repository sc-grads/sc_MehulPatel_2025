-- Selects all employee numbers from the Employee table (tblEmployee) that do NOT have a matching transaction.
-- This uses a LEFT JOIN and filters where the join fails (i.e., T.EmployeeNumber is NULL).
select E.EmployeeNumber 
from tblEmployee as E 
left join tblTransaction as T
    on E.EmployeeNumber = T.EmployeeNumber
where T.EmployeeNumber IS NULL
order by E.EmployeeNumber;

-- Selects the maximum EmployeeNumber from the Transaction table (tblTransaction).
-- This can be useful for generating a sequence or determining the upper limit for IDs.
select max(EmployeeNumber) 
from tblTransaction;

-- Creates a Common Table Expression (CTE) named "Numbers" to generate a sequence of numbers
-- from 1 up to the maximum EmployeeNumber found in tblTransaction.
with Numbers as (
    select top (
        select max(EmployeeNumber) 
        from tblTransaction
    ) 
    row_number() over(order by (select null)) as RowNumber
    from tblTransaction as U
)

-- Selects the numbers from the generated sequence that do NOT appear as EmployeeNumbers in the Transaction table.
-- This is effectively finding gaps in the EmployeeNumber sequence.
select U.RowNumber 
from Numbers as U
left join tblTransaction as T
    on U.RowNumber = T.EmployeeNumber
where T.EmployeeNumber is null
order by U.RowNumber;

-- Generates a large set of row numbers using a CROSS JOIN of sys.objects with itself.
-- This is often used as a technique to generate a large sequence of numbers.
select row_number() over(order by(select null)) 
from sys.objects O 
cross join sys.objects;
