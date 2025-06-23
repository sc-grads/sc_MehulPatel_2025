-- Step 1: View data before changes

-- Check if the employee with EmployeeNumber = 194 exists
select * 
from tblEmployee 
where EmployeeNumber = 194;

-- View all transactions currently assigned to EmployeeNumber = 3
select * 
from tblTransaction 
where EmployeeNumber = 3;

-- View transactions already linked to EmployeeNumber = 194
select * 
from tblTransaction 
where EmployeeNumber = 194;

-- Step 2: Begin a transaction block to group changes

begin tran;

-- Step 3: Update transactions from employees 3, 5, 7, and 9 to EmployeeNumber = 194
-- Use OUTPUT to show what changed for logging or verification
update tblTransaction
set EmployeeNumber = 194
output 
    inserted.EmployeeNumber as NewEmployeeNumber,    -- Shows updated value (194)
    deleted.EmployeeNumber as OldEmployeeNumber      -- Shows original value (3, 5, 7, or 9)
from tblTransaction
where EmployeeNumber in (3, 5, 7, 9);

-- Step 4: (Optional) Insert a new transaction manually for testing or demo purposes
-- This is a corrected version of the original insert attempt
--insert into tblTransaction (EmployeeNumber, Amount, TransactionDate)
--values (194, 100.00, GETDATE());

-- Step 5: Delete any remaining transactions still linked to EmployeeNumber = 3
-- This might be unnecessary if all were already updated above
delete tblTransaction
from tblTransaction
where EmployeeNumber = 3;

-- Step 6: Verify the result after update and delete
select * 
from tblTransaction 
where EmployeeNumber = 194;

-- Step 7: Rollback the entire transaction to undo all the above changes
-- This keeps your data unchanged (for testing purposes only)
rollback tran;

-- Step 8: Verify that data is still in its original state
select * 
from tblTransaction 
where EmployeeNumber in (3, 5, 7, 9, 194);
