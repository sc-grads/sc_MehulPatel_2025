-- Alters or creates a trigger named 'tr_ViewByDepartment' on the view 'ViewByDepartment'
-- It is triggered INSTEAD OF a DELETE operation (because you can't delete directly from a view backed by joins)
alter TRIGGER tr_ViewByDepartment  
ON dbo.ViewByDepartment  
INSTEAD OF DELETE  
AS  
BEGIN  

    -- Declares local variables to hold values from the DELETED table
    -- Problem: This only holds ONE row's data, even if DELETE affects many rows
    declare @EmployeeNumber as int  
    declare @DateOfTransaction as smalldatetime  
    declare @Amount as smallmoney  

    -- Assigns values from the DELETED pseudo-table to the variables
    -- This only works for ONE row (first row), and ignores the rest
    select @EmployeeNumber = EmployeeNumber,  
           @DateOfTransaction = DateOfTransaction,  
           @Amount = TotalAmount  
    from deleted  

    -- Deletes from the base table tblTransaction where it matches the captured values
    -- Since only one set of values is captured, it deletes at most ONE row
    delete tblTransaction  
    from tblTransaction as T  
    where T.EmployeeNumber = @EmployeeNumber  
      and T.DateOfTransaction = @DateOfTransaction  
      and T.Amount = @Amount  

END  


-- Begins a transaction to test the delete logic safely
begin tran  

-- Shows all records for EmployeeNumber = 132 before delete
SELECT * FROM ViewByDepartment where EmployeeNumber = 132  

-- Attempts to delete all rows for EmployeeNumber = 132
-- Only one row will be deleted due to single-row logic above
delete from ViewByDepartment  
where EmployeeNumber = 132  

-- Shows remaining rows — at least one row may still exist due to the bad trigger
SELECT * FROM ViewByDepartment where EmployeeNumber = 132  

-- Rolls back the transaction to undo all changes
rollback tran  


--  GOOD CODE: This version supports deleting multiple rows properly using JOIN with the deleted pseudo-table

-- Alters the same trigger to handle MULTIPLE deleted rows correctly
alter TRIGGER tr_ViewByDepartment  
ON dbo.ViewByDepartment  
INSTEAD OF DELETE  
AS  
BEGIN  

    -- Optionally shows which rows are being deleted
    SELECT *, 'To Be Deleted' FROM deleted  

    -- Deletes from the base table tblTransaction by joining it with the DELETED pseudo-table
    -- This allows deletion of all matching rows in a set-based way (not just one)
    delete tblTransaction  
    from tblTransaction as T  
    join deleted as D  
      on T.EmployeeNumber = D.EmployeeNumber  
     and T.DateOfTransaction = D.DateOfTransaction  
     and T.Amount = D.TotalAmount  

END  
GO  


-- Begins a new transaction to test the fixed multi-row delete
begin tran  

-- Shows all rows to be deleted before actual delete
SELECT *, 'Before Delete' FROM ViewByDepartment where EmployeeNumber = 132  

-- Deletes all matching rows for EmployeeNumber = 132
-- Works for multiple rows now
delete from ViewByDepartment  
where EmployeeNumber = 132 -- You can add more conditions like TotalAmount if needed  

-- Shows results after delete to confirm rows were removed
SELECT *, 'After Delete' FROM ViewByDepartment where EmployeeNumber = 132  

-- Rolls back the transaction to preserve original data
rollback tran  
