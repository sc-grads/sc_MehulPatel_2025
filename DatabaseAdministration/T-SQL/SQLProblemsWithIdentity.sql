--Problems with IDENTITY 
-- Start a transaction to group the following operations so they can be rolled back if needed
begin tran

-- Insert a new row into tblEmployee2 with the value 'New Name' for the only column expected (assuming others are IDENTITY or have defaults)
insert into tblEmployee2
values ('New Name')

-- Select all rows from tblEmployee2 to show current data, including the newly inserted row
select * from tblEmployee2

-- Roll back the transaction, undoing the insert operation above
rollback tran

-- Remove all rows from tblEmployee2 quickly and reset any identity counters (cannot be used within an explicit transaction)
truncate table tblEmployee2
