--CREATING AN AFTER TRIGGER

-- Alters or creates a trigger named TR_tblTransaction on the table 'tblTransaction'

-- The trigger fires AFTER an INSERT, DELETE, or UPDATE operation is performed

ALTER TRIGGER TR_tblTransaction

ON tblTransaction

AFTER DELETE, INSERT, UPDATE -- Specifies the operations that trigger it

AS

BEGIN


-- This line (commented out) would insert the new/updated rows into another table called 'tblTransaction2'

-- INSERTED is a special table that temporarily holds the new rows (for INSERT or UPDATE)

--insert into tblTransaction2

select *, 'Inserted' from Inserted -- Displays new rows with a label 'Inserted'


-- This line (commented out) would insert the deleted rows into another table

-- DELETED is a special table that temporarily holds the old rows (for DELETE or UPDATE)

--insert into tblTransaction2

select *, 'Deleted' from Deleted -- Displays old rows with a label 'Deleted'


END

GO



-- Starts a transaction so that changes can be tested without affecting the actual data

BEGIN TRAN


-- Inserts a new row into 'tblTransaction'. This will trigger the AFTER INSERT part of the trigger

insert into tblTransaction(Amount, DateOfTransaction, EmployeeNumber)

VALUES (123, '2015-07-10', 123)


-- This line (commented out) would delete the same row, which would trigger the DELETE part of the trigger

--delete tblTransaction

--where EmployeeNumber = 123 and DateOfTransaction = '2015-07-10'


-- Rolls back the transaction, undoing the insert. No changes are saved.

ROLLBACK TRAN

GO



-- Disables the trigger, so it will no longer fire on INSERT/UPDATE/DELETE

DISABLE TRIGGER TR_tblTransaction ON tblTransaction;

GO


-- Enables the trigger again, reactivating it

ENABLE TRIGGER TR_tblTransaction ON tblTransaction;

GO


-- Permanently deletes the trigger from the database

DROP TRIGGER TR_tblTransaction;

GO