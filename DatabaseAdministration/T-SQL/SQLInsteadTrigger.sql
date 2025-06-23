--CREATING AN INSTEAD OF AN TRIGGER

-- Alters (or creates) a trigger named 'tr_ViewByDepartment' on the view 'ViewByDepartment'

-- This is an INSTEAD OF DELETE trigger, meaning it overrides the default delete behavior on the view

alter TRIGGER tr_ViewByDepartment

ON dbo.ViewByDepartment

INSTEAD OF DELETE -- Replaces the default DELETE logic with custom logic defined below

AS

BEGIN


-- Declares a variable to hold the EmployeeNumber from the deleted row

declare @EmployeeNumber as int


-- Declares a variable to hold the DateOfTransaction from the deleted row

declare @DateOfTransaction as smalldatetime


-- Declares a variable to hold the Amount (called TotalAmount in the view) from the deleted row

declare @Amount as smallmoney


-- Retrieves values from the special 'deleted' table (holds the rows being deleted from the view)

-- and assigns them to the declared variables

-- Note: This version assumes only one row is being deleted at a time

select

@EmployeeNumber = EmployeeNumber,

@DateOfTransaction = DateOfTransaction,

@Amount = TotalAmount

from deleted


-- (Optional) You could uncomment this to view what’s in the 'deleted' table

--SELECT * FROM deleted


-- Deletes the matching row from the base table 'tblTransaction'

-- Uses the values captured from the deleted row in the view

delete tblTransaction

from tblTransaction as T

where T.EmployeeNumber = @EmployeeNumber

and T.DateOfTransaction = @DateOfTransaction

and T.Amount = @Amount


END



-- Starts a new transaction so you can test the delete operation without permanently affecting the data

begin tran


-- (Optional) This would display the row before deletion, if uncommented

--SELECT * FROM ViewByDepartment where TotalAmount = -2.77 and EmployeeNumber = 132


-- Tries to delete a row from the view

-- Since this is a view, and normally not directly updatable, the INSTEAD OF DELETE trigger handles the operation

delete from ViewByDepartment

where TotalAmount = -2.77 and EmployeeNumber = 132


-- Displays the same row again to check whether the delete was successful

-- If the row is missing, the delete worked

SELECT * FROM ViewByDepartment where TotalAmount = -2.77 and EmployeeNumber = 132


-- Rolls back the transaction so that the delete is undone

-- This is useful for testing without affecting real data

rollback tran