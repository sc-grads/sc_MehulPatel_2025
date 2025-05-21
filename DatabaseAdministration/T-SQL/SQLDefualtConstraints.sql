-- Add a new column named DateOfEntry to the tblTransaction table without a default value
alter table tblTransaction
add DateOfEntry datetime;

-- Add a default constraint on the DateOfEntry column so that if no value is provided during insert,
-- the current date and time (GETDATE()) is automatically used
alter table tblTransaction
add constraint defDateOfEntry DEFAULT GETDATE() for DateOfEntry;

-- Delete records from tblTransaction where EmployeeNumber is less than 3
-- (possibly to clean up test or old data)
delete from tblTransaction where EmployeeNumber < 3;

-- Insert a record without specifying DateOfEntry
-- The default value (current date/time) will be used automatically
insert into tblTransaction(Amount, DateOfTransaction, EmployeeNumber)
values (1, '2014-01-01', 1);

-- Insert a record and manually specify the DateOfEntry value
-- In this case, the default value is not used because a value is provided
insert into tblTransaction(Amount, DateOfTransaction, EmployeeNumber, DateOfEntry)
values (2, '2014-01-02', 1, '2013-01-01');

-- View the records with EmployeeNumber less than 3 to see the effect of default and manual entries
select * from tblTransaction where EmployeeNumber < 3;

-- Create a new table named tblTransaction2 with a default constraint on DateOfEntry column
-- The constraint ensures DateOfEntry is filled with the current date/time if not provided
create table tblTransaction2
(
    Amount smallmoney not null,
    DateOfTransaction smalldatetime not null,
    EmployeeNumber int not null,
    DateOfEntry datetime null CONSTRAINT tblTransaction2_defDateOfEntry DEFAULT GETDATE()
);

-- Insert a row into tblTransaction2 without DateOfEntry
-- The default value (GETDATE()) will be used
insert into tblTransaction2(Amount, DateOfTransaction, EmployeeNumber)
values (1, '2014-01-01', 1);

-- Insert a row into tblTransaction2 and explicitly provide DateOfEntry
-- The provided value will override the default
insert into tblTransaction2(Amount, DateOfTransaction, EmployeeNumber, DateOfEntry)
values (2, '2014-01-02', 1, '2013-01-01');

-- Select all records for EmployeeNumber less than 3 to verify entries
select * from tblTransaction2 where EmployeeNumber < 3;

-- Delete (drop) the tblTransaction2 table completely
-- This removes all data, columns, and constraints from this table
drop table tblTransaction2;

-- Remove the DateOfEntry column from tblTransaction
alter table tblTransaction
drop column DateOfEntry;

-- Remove the default constraint from tblTransaction
-- Note: This line should ideally come *before* dropping the column
-- Otherwise, SQL Server will throw an error if the constraint still exists
alter table tblTransaction
drop constraint defDateOfEntry;

-- Start a new transaction to temporarily test adding a default column
BEGIN TRAN;

-- Add DateOfEntry column again to tblTransaction, with a default value of GETDATE()
-- The `WITH VALUES` clause applies the default value to existing rows as well
ALTER TABLE tblTransaction
ADD DateOfEntry datetime
DEFAULT GETDATE() WITH VALUES;

-- View all records in tblTransaction to verify that DateOfEntry is populated
SELECT * FROM tblTransaction;

-- Rollback the transaction, undoing the changes (i.e., column addition will be reversed)
ROLLBACK TRAN;
