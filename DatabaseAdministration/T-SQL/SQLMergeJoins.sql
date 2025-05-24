-- Create a unique clustered index on EmployeeNumber in tblEmployee table
-- This physically sorts the table on EmployeeNumber and enforces uniqueness
CREATE UNIQUE CLUSTERED INDEX [idx_tblEmployee] ON [dbo].[tblEmployee]
([EmployeeNumber])
GO

-- Create a unique clustered index on composite key (EmployeeNumber, DateOfTransaction, Amount) in tblTransaction table
-- This sorts and uniquely identifies each transaction record by these three columns
CREATE UNIQUE CLUSTERED INDEX [idx_tblTransaction] ON [dbo].[tblTransaction]
([EmployeeNumber],[DateOfTransaction],[Amount])
GO

-- Perform a LEFT JOIN between tblEmployee and tblTransaction on EmployeeNumber
-- Because both tables are indexed on EmployeeNumber (and in tblTransaction, also on DateOfTransaction and Amount),
-- SQL Server can efficiently perform a Merge Join which requires sorted inputs
select E.EmployeeNumber, T.Amount
from [dbo].[tblEmployee] as E
left join [dbo].[tblTransaction] as T
on E.EmployeeNumber = T.EmployeeNumber

-- Create a new table tblEmployeeNoIndex by copying all data from tblEmployee
-- This new table does NOT have any indexes, so queries against it will be less efficient
select *
into dbo.tblEmployeeNoIndex
from dbo.tblEmployee

-- Create a new table tblTransactionNoIndex by copying all data from tblTransaction
-- This new table also has no indexes, so queries against it will perform table scans
select *
into dbo.tblTransactionNoIndex
from dbo.tblTransaction

-- Repeat the LEFT JOIN query, now using the original tables with indexes
-- This should again use an efficient Merge Join because of the clustered indexes
select E.EmployeeNumber, T.Amount
from [dbo].[tblEmployee] as E
left join [dbo].[tblTransaction] as T
on E.EmployeeNumber = T.EmployeeNumber

-- Perform the same LEFT JOIN query, but now using the copies without indexes
-- Without indexes, SQL Server cannot use a Merge Join efficiently and will likely use a Hash Match or Nested Loop with scans
select E.EmployeeNumber, T.Amount
from [dbo].[tblEmployeeNoIndex] as E
left join [dbo].[tblTransactionNoIndex] as T
on E.EmployeeNumber = T.EmployeeNumber
