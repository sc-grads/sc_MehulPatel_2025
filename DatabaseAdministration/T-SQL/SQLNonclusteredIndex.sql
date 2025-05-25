-- Create a non-clustered index on the DateOfBirth column in the tblEmployee table
create nonclustered index idx_tblEmployee_DateOfBirth on
[dbo].[tblEmployee]([DateOfBirth])

-- Create a non-clustered composite index on DateOfBirth and Department columns in tblEmployee table
create nonclustered index idx_tblEmployee_DateOfBirth_Department on
[dbo].[tblEmployee]([DateOfBirth], Department)

-- Drop the index named idx_tblEmployee from tblEmployee (assumes such an index exists; might error if it doesn’t)
drop index idx_tblEmployee on [dbo].[tblEmployee]

-- Select rows from tblEmployee2 where EmployeeNumber is 127
select * from [dbo].[tblEmployee2] where [EmployeeNumber] = 127

-- Select all rows from tblEmployee2
select * from [dbo].[tblEmployee2]

-- Select DateOfBirth and Department from tblEmployee where DateOfBirth is in the year 1992
select DateOfBirth, Department
from [dbo].[tblEmployee]
where DateOfBirth >= '1992-01-01' and DateOfBirth < '1993-01-01'

-- seek = few number of rows based on the index
-- scan = going through the entire table

-- Add a UNIQUE constraint on the Department column in tblDepartment (ensures all department names are unique)
alter table [dbo].[tblDepartment]
add constraint unq_tblDepartment UNIQUE(Department)
