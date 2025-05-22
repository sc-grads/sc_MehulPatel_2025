-- Alters or creates a trigger named TR_tblTransaction on the tblTransaction table
-- This trigger will execute AFTER DELETE, INSERT, or UPDATE events on the table
ALTER TRIGGER TR_tblTransaction  
ON tblTransaction  
AFTER DELETE, INSERT, UPDATE  
AS  
BEGIN  

    -- Checks if any rows were affected by the DML operation (insert/update/delete)
    IF @@ROWCOUNT > 0  
    BEGIN  

        -- Displays all rows in the special INSERTED table (new data after insert/update)
        select * from Inserted  

        -- Displays all rows in the special DELETED table (old data before update/delete)
        select * from Deleted  

    END  

END  
GO  


-- Inserts a new row into tblTransaction (triggers the AFTER INSERT logic)
insert into tblTransaction(Amount, DateOfTransaction, EmployeeNumber)  
VALUES (123, '2015-07-11', 123)  


-- Checks if a specific record exists in the view before performing a delete
SELECT * FROM ViewByDepartment where TotalAmount = -2.77 and EmployeeNumber = 132  


-- Begins a transaction so that any changes can be rolled back (not saved permanently)
begin tran  

-- Attempts to delete a row from the view (calls an INSTEAD OF DELETE trigger on the view if defined)
delete from ViewByDepartment  
where TotalAmount = -2.77 and EmployeeNumber = 132  

-- Rolls back the deletion — this undoes the change
rollback tran  


-- Alters the trigger again to use UPDATE() function instead of @@ROWCOUNT
-- This version specifically checks if the 'Amount' column was updated
ALTER TRIGGER TR_tblTransaction  
ON tblTransaction  
AFTER DELETE, INSERT, UPDATE  
AS  
BEGIN  

    -- This function checks whether the 'Amount' column was part of the UPDATE
    -- Equivalent to checking whether bitmask for 'Amount' is set in COLUMNS_UPDATED()
    IF UPDATE(Amount)  -- Only runs this block if Amount was modified
    BEGIN  

        -- Shows new data after the UPDATE (or INSERT)
        select * from Inserted  

        -- Shows old data before the UPDATE (or DELETE)
        select * from Deleted  

    END  

END  
GO  


-- Starts a transaction to test the update on the view
begin tran  

-- Attempts to update the TotalAmount column in the view (triggers INSTEAD OF UPDATE if defined)
update ViewByDepartment  
set TotalAmount = +2.77  -- Changes the amount to a positive value
where TotalAmount = -2.77 and EmployeeNumber = 132  

-- Rolls back the update so the original data is preserved
rollback tran  
