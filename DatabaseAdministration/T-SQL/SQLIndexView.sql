-- Switches the context to the '70-461' database to ensure all commands run in the right database

-- Checks if the view 'ViewByDepartment' already exists in the 'dbo' schema
-- Uses INFORMATION_SCHEMA for a standardized way to inspect metadata
if exists(
    select * 
    from INFORMATION_SCHEMA.VIEWS  
    where [TABLE_NAME] = 'ViewByDepartment'  
      and [TABLE_SCHEMA] = 'dbo'  
)  

   -- If the view exists, drop (delete) it so it can be recreated
   drop view dbo.ViewByDepartment  
GO  


-- Creates a new view named 'ViewByDepartment' with 'SCHEMABINDING'
-- 'SCHEMABINDING' locks the view to the structure of the underlying tables,
-- meaning you cannot drop or change the schema (columns, etc.) of those tables
-- unless you first drop this view
CREATE view [dbo].[ViewByDepartment] with schemabinding as  

-- Selects department, employee number, transaction date, and amount (renamed as TotalAmount)
select 
    D.Department, 
    T.EmployeeNumber, 
    T.DateOfTransaction, 
    T.Amount as TotalAmount  

-- From the base table 'tblDepartment', aliased as D
from dbo.tblDepartment as D  

-- INNER JOIN only includes records where departments match in both tables
inner join dbo.tblEmployee as E  
on D.Department = E.Department  

-- INNER JOIN only includes records where employee numbers match in both tables
inner join dbo.tblTransaction as T  
on E.EmployeeNumber = T.EmployeeNumber  

-- Filters the view to include only employees with numbers between 120 and 139
where T.EmployeeNumber between 120 and 139  
GO  


-- Creates a UNIQUE CLUSTERED INDEX on the view
-- This is required for **indexed views** (views with SCHEMABINDING) in SQL Server
-- The index ensures that the combination of EmployeeNumber and Department is unique in the view
CREATE UNIQUE CLUSTERED INDEX inx_ViewByDepartment 
on dbo.ViewByDepartment(EmployeeNumber, Department)  


-- Starts a transaction block
-- This means the following operations are temporary until explicitly committed
begin tran  


-- Attempts to drop (delete) the table 'tblEmployee'
-- This will fail because the view is SCHEMABOUND to 'tblEmployee'
-- SCHEMABINDING prevents dropping or altering dependent tables
drop table tblEmployee  


-- Rolls back the transaction, canceling the attempted DROP TABLE
-- No changes are saved; the table remains as it was
rollback tran
