-- Displays all rows from the view 'ViewByDepartment'
SELECT * FROM ViewByDepartment  


-- Attempts to delete a row from the 'ViewByDepartment' view
-- Only works if the view is updatable and the delete can be mapped directly to the base table (like tblTransaction)
delete from ViewByDepartment  
where TotalAmount = 999.99 and EmployeeNumber = 132  
-- This will delete the transaction for employee 132 where the amount is exactly 999.99

GO  


-- Creates a new simple view called 'ViewSimple'
-- This view just selects all data from the base table 'tblTransaction'
CREATE VIEW ViewSimple  
as  
SELECT * FROM tblTransaction  -- Simple view with all columns and rows from the transaction table
GO  


-- Begins a new transaction block so changes can be tested and rolled back
BEGIN TRAN  


-- Deletes all transactions for employee number 132 from the 'ViewSimple' view
-- Since this is a simple view on a single base table with no filters, deletes are allowed
delete from ViewSimple  
where EmployeeNumber = 132  


-- Shows the data after the delete, to confirm if the rows for employee 132 were removed
select * from ViewSimple  


-- Rolls back the transaction so that no changes are actually saved to the database
-- This undo the delete operation, restoring the original data
ROLLBACK TRAN  
