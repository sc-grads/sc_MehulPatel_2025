--NEXT VALUE FOR sequences 
---- Begin a transaction block
--BEGIN TRAN

-- Create a sequence named 'newSeq' as a BIGINT type
CREATE SEQUENCE newSeq AS BIGINT
-- Sequence starts at 1
START WITH 1
-- Sequence increments by 1 for each call
INCREMENT BY 1
-- Minimum value of the sequence is 1
MINVALUE 1
-- Cache 50 sequence values for performance
CACHE 50

-- Select the next value from 'newSeq' sequence, aliasing the output as NextValue
select NEXT VALUE FOR newSeq as NextValue;

-- Commented out: Attempt to select rows from tblTransaction with a new column that uses NEXT VALUE FOR with an OVER clause
--select *, NEXT VALUE FOR newSeq OVER (ORDER BY DateOfTransaction) as NextNumber from tblTransaction

-- Rollback the transaction, undoing sequence creation and select statement
rollback tran

-- Create the 'newSeq' sequence again with the same options
CREATE SEQUENCE newSeq AS BIGINT
START WITH 1
INCREMENT BY 1
MINVALUE 1
--MAXVALUE 999999 -- commented out max value
--CYCLE -- commented out cycle option
CACHE 50

-- Alter tblTransaction table to add a new column 'NextNumber' of type int
-- Add a default constraint 'DF_Transaction' that sets the default value of 'NextNumber' to NEXT VALUE FOR newSeq
alter table tblTransaction
ADD NextNumber int CONSTRAINT DF_Transaction DEFAULT NEXT VALUE FOR newSeq

-- Drop the default constraint 'DF_Transaction' from tblTransaction
alter table tblTransaction
drop DF_Transaction

-- Drop the 'NextNumber' column from tblTransaction
alter table tblTransaction
drop column NextNumber

-- Add the 'NextNumber' column again as int
alter table tblTransaction
add NextNumber int

-- Add the default constraint 'DF_Transaction' back to 'NextNumber' column with NEXT VALUE FOR newSeq
alter table tblTransaction
add CONSTRAINT DF_Transaction DEFAULT NEXT VALUE FOR newSeq for NextNumber

-- Begin another transaction block
begin tran

-- Select all rows from tblTransaction
select * from tblTransaction

-- Insert a new row into tblTransaction with Amount=1, DateOfTransaction='2017-01-01', EmployeeNumber=123
INSERT INTO tblTransaction(Amount, DateOfTransaction, EmployeeNumber)
VALUES (1,'2017-01-01',123)

-- Select rows from tblTransaction where EmployeeNumber = 123
select * from tblTransaction WHERE EmployeeNumber = 123;

-- Update tblTransaction, setting NextNumber to the next sequence value for rows where NextNumber is NULL
update tblTransaction
set NextNumber = NEXT VALUE FOR newSeq
where NextNumber is null

-- Select all rows from tblTransaction (all columns)
select * from tblTransaction --WHERE EmployeeNumber = 123

-- Roll back the transaction, undoing all above changes
ROLLBACK TRAN

-- Commented out: Enable manual insertion into identity column (not executed)
--SET IDENTITY_INSERT tablename ON

-- Commented out: Reset identity seed for a table (not executed)
--DBCC CHECKIDENT(tablename,RESEED)

-- Restart the sequence 'newSeq' back to 1
alter sequence newSeq
restart with 1

-- Drop the default constraint 'DF_Transaction' from tblTransaction
alter table tblTransaction
drop DF_Transaction

-- Drop the 'NextNumber' column from tblTransaction
alter table tblTransaction
drop column NextNumber

-- Drop the sequence object 'newSeq' entirely
DROP SEQUENCE newSeq
