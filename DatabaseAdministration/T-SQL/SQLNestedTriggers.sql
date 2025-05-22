-- Alters or creates a trigger named 'TR_tblTransaction' on the table 'tblTransaction'
-- This trigger will fire AFTER an INSERT, DELETE, or UPDATE operation on the table
ALTER TRIGGER TR_tblTransaction  
ON tblTransaction  
AFTER DELETE, INSERT, UPDATE  
AS  
BEGIN  

    -- Checks if the current trigger execution is at the top level (not nested inside another trigger)
    -- @@NESTLEVEL returns how deeply nested the current trigger call is
    if @@NESTLEVEL = 1  

    begin  

        -- Displays the rows from the INSERTED table with a label 'TABLEINSERT'
        -- INSERTED holds the new data for INSERT and UPDATE operations
        select *, 'TABLEINSERT' from Inserted  

        -- Displays the rows from the DELETED table with a label 'TABLEDELETE'
        -- DELETED holds the old data for DELETE and UPDATE operations
        select *, 'TABLEDELETE' from Deleted  

    end  

END  
GO  


-- Starts a transaction so changes can be tested and then rolled back
BEGIN TRAN  

-- Inserts a new row into the 'tblTransaction' table
-- This triggers the AFTER INSERT section of TR_tblTransaction
insert into tblTransaction(Amount, DateOfTransaction, EmployeeNumber)  
VALUES (123, '2015-07-10', 123)  

-- Rolls back the transaction to undo the insert and prevent permanent changes
ROLLBACK TRAN  


-- Starts another transaction block
begin tran  

-- (Optional) This line, if uncommented, would display the row before deletion
--SELECT * FROM ViewByDepartment where TotalAmount = -2.77 and EmployeeNumber = 132  

-- Attempts to delete a row from the view 'ViewByDepartment'
-- This will trigger the INSTEAD OF DELETE trigger (if defined) on the view,
-- which may perform a delete on the base table (tblTransaction)
delete from ViewByDepartment  
where TotalAmount = -2.77 and EmployeeNumber = 132  

-- (Optional) This would show if the row was successfully deleted
--SELECT * FROM ViewByDepartment where TotalAmount = -2.77 and EmployeeNumber = 132  

-- Rolls back the transaction so the delete is undone — no real data is changed
rollback tran  


-- Displays the current configuration value of the 'nested triggers' setting
-- This setting controls whether one trigger can fire another
EXEC sp_configure 'nested triggers';  


-- Changes the configuration to disable nested triggers (set to 0 = off)
-- With this off, triggers won't trigger other triggers
EXEC sp_configure 'nested triggers', 0;  

-- Applies the above configuration change
RECONFIGURE  
GO  
