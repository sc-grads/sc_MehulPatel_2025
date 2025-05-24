Dynamic Queries 
-- Create a synonym named 'EmployeeTable' that refers to the base table 'tblEmployee'
create synonym EmployeeTable
for tblEmployee
go

-- Select all rows from the synonym 'EmployeeTable' (which points to 'tblEmployee')
select * from EmployeeTable

-- Create a synonym named 'DateTable' that refers to the base table 'tblDate'
create synonym DateTable
for tblDate
go

-- Select all rows from the synonym 'DateTable' (which points to 'tblDate')
select * from DateTable

-- Create a synonym named 'RemoteTable' that refers to a remote table 'tblRemote' on a linked server 'OVERTHERE'
create synonym RemoteTable
for OVERTHERE.70-461remote.dbo.tblRemote
go

-- Select all rows from the synonym 'RemoteTable' (which points to the remote table)
select * from RemoteTable

-- Declare a variable @command of type varchar(255) and @param of type varchar(50)
declare @command as varchar(255), @param as varchar(50);

-- Set @command to a string containing a partial SQL statement (note: vulnerable to SQL injection)
set @command = 'select * from tblEmployee where EmployeeNumber = '

-- Set @param to the string '129' (the EmployeeNumber to query)
set @param ='129'

-- Execute the concatenated SQL command (this concatenation can lead to SQL injection if user input is not sanitized)
execute (@command + @param); --sql injection potential
go

-- Declare variables @command and @param as nvarchar for Unicode support
declare @command as nvarchar(255), @param as nvarchar(50);

-- Set @command to a parameterized SQL statement with a parameter named @ProductID
set @command = N'select * from tblEmployee where EmployeeNumber = @ProductID'

-- Set @param to the string '129' (the EmployeeNumber to query)
set @param =N'129'

-- Execute the parameterized SQL query safely using sp_executesql
-- This prevents SQL injection by separating code and parameters
execute sys.sp_executesql 
    @statement = @command,          -- The SQL statement to execute
    @params = N'@ProductID int',    -- Declare the parameter @ProductID as int
    @ProductID = @param;            -- Assign the value of @param to @ProductID
