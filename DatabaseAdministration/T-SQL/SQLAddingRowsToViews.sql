-- Starts a new transaction block. All actions inside can be committed or rolled back together.
begin tran  

-- Attempts to insert a new transaction record into the 'ViewByDepartment' view.
-- This only works if the view is updatable and allows insert operations.
insert into ViewByDepartment(EmployeeNumber, DateOfTransaction, TotalAmount)  
values (132, '2015-07-07', 999.99)  -- Adding a new transaction for employee #132

-- Displays all data from the view, sorted by department and employee number.
select * from ViewByDepartment order by Department, EmployeeNumber  

-- Rolls back the transaction, undoing the insert. No changes are saved to the database.
rollback tran  


-- Starts another transaction block.
begin tran  

-- Shows the current data in the view, sorted by employee number and transaction date.
select * from ViewByDepartment order by EmployeeNumber, DateOfTransaction  

-- This commented line would show data directly from the underlying table.
--Select * from tblTransaction where EmployeeNumber in (132,142)  

-- Attempts to update employee number from 132 to 142 through the view.
-- Again, only works if the view allows updates and the underlying data is updatable.
update ViewByDepartment  
set EmployeeNumber = 142  
where EmployeeNumber = 132  

-- Displays the data again to verify whether the update took place.
select * from ViewByDepartment order by EmployeeNumber, DateOfTransaction  

-- This commented line would show the same data directly from the base table.
--Select * from tblTransaction where EmployeeNumber in (132,142)  

-- Rolls back the update. The data reverts to its previous state.
rollback tran  


-- Switches context to the '70-461' database to make sure we’re working in the right place.
USE [70-461]  
GO  

-- Checks if the view 'ViewByDepartment' exists in the 'dbo' schema using the system information schema.
if exists(
    select * 
    from INFORMATION_SCHEMA.VIEWS  
    where [TABLE_NAME] = 'ViewByDepartment'  
      and [TABLE_SCHEMA] = 'dbo'  
)  

   -- If the view exists, it is deleted so we can recreate it with a new definition.
   drop view dbo.ViewByDepartment  
GO  


-- Recreates the 'ViewByDepartment' view with a new definition.
CREATE view [dbo].[ViewByDepartment] as  

-- Selects the department, employee number, transaction date, and amount (renamed as TotalAmount).
select D.Department, T.EmployeeNumber, T.DateOfTransaction, T.Amount as TotalAmount  

-- Starts with the department table.
from tblDepartment as D  

-- Left join includes all departments, even if no employees exist in them.
left join tblEmployee as E  
on D.Department = E.Department  

-- Left join includes all employees, even if they don't have transactions.
left join tblTransaction as T  
on E.EmployeeNumber = T.EmployeeNumber  

-- Filters the data to only include employee numbers between 120 and 139.
where T.EmployeeNumber between 120 and 139  

-- WITH CHECK OPTION ensures that any inserts/updates through the view must meet the WHERE clause condition.
-- For example, you can't insert an employee with EmployeeNumber = 150 using this view.
WITH CHECK OPTION  

-- This line is commented out. It would sort the results if uncommented.
--order by D.Department, T.EmployeeNumber  

-- End of the SQL batch.
GO  
