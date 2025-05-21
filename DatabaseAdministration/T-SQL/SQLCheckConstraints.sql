-- Adds a CHECK constraint named 'chkAmount' on tblTransaction table
-- It ensures that the Amount column must be greater than -1000 and less than 1000
alter table tblTransaction  
add constraint chkAmount check (Amount > -1000 and Amount < 1000)  


-- Attempts to insert a row into tblTransaction with Amount = 1010
-- This will fail because 1010 is outside the allowed range defined by chkAmount
insert into tblTransaction  
values (1010, '2014-01-01', 1)  


-- Alters the tblEmployee table to add a CHECK constraint named 'chkMiddleName'
-- Uses WITH NOCHECK to add the constraint without validating existing data
-- The constraint enforces that EmployeeMiddleName cannot contain a '.' character unless it's NULL
alter table tblEmployee with nocheck  
add constraint chkMiddleName check  
(REPLACE(EmployeeMiddleName, '.', '') = EmployeeMiddleName or EmployeeMiddleName is null)  


-- Drops the previously created CHECK constraint named 'chkMiddleName' from tblEmployee table
alter table tblEmployee  
drop constraint chkMiddleName  


-- Starts a transaction block to test data insertion safely
begin tran  

  -- Attempts to insert a new employee record where EmployeeMiddleName contains a '.'
  insert into tblEmployee  
  values (2003, 'A', 'B.', 'C', 'D', '2014-01-01', 'Accounts')  

  -- Selects the newly inserted employee row to verify insertion
  select * from tblEmployee where EmployeeNumber = 2003  

-- Rolls back the transaction to undo the insert and keep the table unchanged
rollback tran  


-- Adds another CHECK constraint named 'chkDateOfBirth' on tblEmployee table without validating existing data
-- This constraint ensures that DateOfBirth must be between Jan 1, 1900 and the current date
alter table tblEmployee with nocheck  
add constraint chkDateOfBirth check (DateOfBirth between '1900-01-01' and getdate())  


-- Starts a transaction block for safe testing
begin tran  

  -- Tries to insert a row with an invalid future DateOfBirth ('2115-01-01')
  -- This insert should violate the chkDateOfBirth constraint
  insert into tblEmployee  
  values (2003, 'A', 'B', 'C', 'D', '2115-01-01', 'Accounts')  

  -- Checks if the row was inserted
  select * from tblEmployee where EmployeeNumber = 2003  

-- Rolls back the transaction to prevent the invalid insert from being saved
rollback tran  


-- Creates a new table tblEmployee2 with a column EmployeeMiddleName (nullable)
-- Adds a CHECK constraint named CK_EmployeeMiddleName on the column
-- Ensures EmployeeMiddleName cannot contain '.' character or can be NULL
create table tblEmployee2  
(EmployeeMiddleName varchar(50) null,  
constraint CK_EmployeeMiddleName check  
(REPLACE(EmployeeMiddleName, '.', '') = EmployeeMiddleName or EmployeeMiddleName is null))  


-- Drops the temporary table tblEmployee2 (cleanup)
drop table tblEmployee2  


-- Drops the chkDateOfBirth constraint from tblEmployee table
alter table tblEmployee  
drop constraint chkDateOfBirth  


-- Drops the chkMiddleName constraint from tblEmployee table (if exists)
alter table tblEmployee  
drop constraint chkMiddleName  


-- Drops the chkAmount constraint from tblTransaction table
alter table tblTransaction  
drop constraint chkAmount  
