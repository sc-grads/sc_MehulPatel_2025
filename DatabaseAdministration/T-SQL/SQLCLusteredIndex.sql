--Clustered Index 
-- Create a clustered index on the EmployeeNumber column in tblEmployee table
create clustered index idx_tblEmployee on [dbo].[tblEmployee]([EmployeeNumber])

-- Drop the clustered index previously created
drop index idx_tblEmployee on [dbo].[tblEmployee]

-- Select rows from tblEmployee2 where EmployeeNumber is 127
select * from [dbo].[tblEmployee2] where [EmployeeNumber] = 127

-- Select all rows from tblEmployee2
select * from [dbo].[tblEmployee2]

-- Create a new table tblEmployee2 by copying rows from tblEmployee where EmployeeNumber is not 131
select *
into [dbo].[tblEmployee2]
from [dbo].[tblEmployee]
where EmployeeNumber <> 131

-- seek = few number of rows based on the index
-- scan = going through the entire table

-- Add a primary key constraint on EmployeeNumber column in tblEmployee2 (automatically creates a clustered index)
alter table [dbo].[tblEmployee2]
add constraint pk_tblEmployee2 PRIMARY KEY(EmployeeNumber)

-- Create a new table myTable with Field1 as an integer primary key (also creates a clustered index)
create table myTable (Field1 int primary key)
