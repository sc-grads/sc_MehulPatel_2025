-- Specifies the database to use for the following SQL commands
USE [70-461]  
GO  

-- Checks if a view named 'ViewByDepartment' exists in the database using the INFORMATION_SCHEMA system view
-- This is safer and more portable than querying sys.views directly
if exists(
    select * 
    from INFORMATION_SCHEMA.VIEWS  
    where [TABLE_NAME] = 'ViewByDepartment'  -- Check for the view name
      and [TABLE_SCHEMA] = 'dbo'             -- Ensure it's in the 'dbo' schema
)  

   -- If the view exists, delete (drop) it so we can recreate or modify it
   drop view dbo.ViewByDepartment  

-- Marks the end of this batch of commands
GO  

-- Creates a new view named 'ViewByDepartment' in the 'dbo' schema
CREATE view [dbo].[ViewByDepartment] as  

-- The view selects data including department name, employee number, transaction date, and amount
select D.Department, T.EmployeeNumber, T.DateOfTransaction, T.Amount as TotalAmount  

-- From the department table, which is aliased as D
from tblDepartment as D  

-- Performs a LEFT JOIN to include all departments, even if they have no employees
left join tblEmployee as E  
on D.Department = E.Department  -- Join condition: match the department name

-- Performs another LEFT JOIN to include all employees, even if they have no transactions
left join tblTransaction as T  
on E.EmployeeNumber = T.EmployeeNumber  -- Join condition: match the employee number

-- Filters the results to include only transactions for employee numbers between 120 and 139
where T.EmployeeNumber between 120 and 139  

-- This line is commented out; if uncommented, it would sort the result by department and employee number
--order by D.Department, T.EmployeeNumber  

-- Marks the end of this batch; required to separate logical sections of SQL code in SQL Server tools
GO  
