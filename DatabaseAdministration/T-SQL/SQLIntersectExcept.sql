-- Select all columns from tblTransaction and assign a row number to each row using ROW_NUMBER()
-- We use modulo 3 (% 3) to divide rows into 3 groups (0, 1, 2)
-- Then store the result into a new table called tblTransactionNew
select *, 
    Row_Number() over(order by (select null)) % 3 as ShouldIDelete
into tblTransactionNew
from tblTransaction

-- Delete rows from tblTransactionNew where the ShouldIDelete column is 1
-- This removes approximately one-third of the data
delete from tblTransactionNew
where ShouldIDelete = 1

-- Update rows where ShouldIDelete = 2
-- We simulate a change by adding 1 day to the DateOfTransaction column
-- This helps simulate data modification
update tblTransactionNew
set DateOfTransaction = dateadd(day, 1, DateOfTransaction)
where ShouldIDelete = 2

-- Remove the helper column ShouldIDelete since we don't need it anymore
alter table tblTransactionNew
drop column ShouldIDelete

-- Now we compare the original and new tables
-- This part shows how INTERSECT and EXCEPT can be used to analyze differences
-- Show rows that are exactly the same in both original and new tables (intersection)
-- Use this to see unchanged rows
select * from tblTransaction
intersect
select * from tblTransactionNew
order by EmployeeNumber

-- Alternatively (commented out for now), you could:
-- Use EXCEPT to find rows in the original table that are NOT in the new one (deleted rows)
-- select * from tblTransaction
-- except
-- select * from tblTransactionNew
-- order by EmployeeNumber

-- Use UNION to combine rows from both tables and remove duplicates
-- Use UNION ALL to combine rows including duplicates (showing all differences)

