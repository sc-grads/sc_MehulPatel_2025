-- Create a new table dbo.tblTransactionBig by copying all data from dbo.tblTransaction
select *
into dbo.tblTransactionBig
from [dbo].[tblTransaction]

-- Insert additional rows into tblTransactionBig by combining Amount from T1 and DateOfTransaction from T2
-- T1 and T2 are both from dbo.tblTransaction, cross joined, creating many combinations
-- EmployeeNumber is set to 1 for all these inserted rows
insert into dbo.tblTransactionBig ([Amount], [DateOfTransaction], [EmployeeNumber])
select T1.Amount, T2.DateOfTransaction, 1 as EmployeeNumber
from [dbo].[tblTransaction] as T1
cross join (select * from [dbo].[tblTransaction] where EmployeeNumber < 200) as T2

-- Create a nonclustered index on EmployeeNumber in tblTransactionBig to improve query performance on that column
create nonclustered index idx_tbltblTransactionBig on
dbo.tblTransactionBig(EmployeeNumber)

-- Create a stored procedure procTransactionBig with a parameter @EmployeeNumber
-- WITH RECOMPILE forces the procedure to recompile each time it runs, ensuring fresh query plans
create proc procTransactionBig(@EmployeeNumber as int) WITH RECOMPILE
as
-- The procedure selects all columns from tblTransactionBig left joined with tblEmployee on EmployeeNumber
-- It filters rows where tblTransactionBig.EmployeeNumber matches the input parameter
select *
from tblTransactionBig as T
left join tblEmployee as E
on T.EmployeeNumber = E.EmployeeNumber
where T.EmployeeNumber = @EmployeeNumber

-- Execute the stored procedure procTransactionBig with EmployeeNumber = 1
exec procTransactionBig 1

-- Execute the stored procedure procTransactionBig with EmployeeNumber = 132
exec procTransactionBig 132
