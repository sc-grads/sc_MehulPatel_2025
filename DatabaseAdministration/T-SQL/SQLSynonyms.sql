--Synonyms 
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
