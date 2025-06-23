-- Add a unique constraint on the EmployeeGovernmentID column in the tblEmployee table
-- This ensures no two employees can have the same government ID
alter table tblEmployee
ADD CONSTRAINT unqGovernmentID UNIQUE (EmployeeGovernmentID);-- this does not work

-- Select government IDs that appear more than once in the tblEmployee table
-- Useful to identify duplicates before applying a unique constraint
select EmployeeGovernmentID, count(EmployeeGovernmentID) as MyCount from tblEmployee
group by EmployeeGovernmentID
having count(EmployeeGovernmentID) > 1;

-- Retrieve employee records where the government ID is either 'HN513777D' or 'TX593671R'
-- This helps verify specific entries, especially potential duplicates
select * from tblEmployee where EmployeeGovernmentID IN ('HN513777D', 'TX593671R');

-- Start a database transaction. Changes made in this block can be rolled back if needed.
begin tran;

-- Delete employee records where EmployeeNumber is less than 3
-- This might be cleanup or test data removal
delete from tblEmployee
where EmployeeNumber < 3;

-- Delete the top 2 records where EmployeeNumber is either 131 or 132
-- Useful for limiting deletion to only a certain number of rows
delete top(2) from tblEmployee
where EmployeeNumber in (131, 132);

-- Recheck the tblEmployee table to see if the specific entries still exist
-- after the delete operations
select * from tblEmployee where EmployeeGovernmentID IN ('HN513777D', 'TX593671R');

-- Commit the transaction so that all changes made within the transaction block are saved permanently
commit tran;

-- Add a unique constraint on the Amount, DateOfTransaction, and EmployeeNumber columns in tblTransaction
-- This ensures no two rows can have the same combination of those three fields
alter table tblTransaction
add constraint unqTransaction UNIQUE (Amount, DateOfTransaction, EmployeeNumber);

-- Delete all transaction records related to the employee with EmployeeNumber = 131
-- This might be required before inserting new records that could violate the unique constraint
delete from tblTransaction
where EmployeeNumber = 131;

-- Insert a new transaction for Employee 131 on Jan 1, 2015 with Amount = 1
insert into tblTransaction
VALUES (1, '2015-01-01', 131);

-- Try to insert the same transaction again, which will fail if the unique constraint is still active
-- because it violates the unique constraint on the combination of values
insert into tblTransaction
VALUES (1, '2015-01-01', 131);

-- Remove the unique constraint from tblTransaction
-- This allows duplicate records to be inserted again
alter table tblTransaction
Drop constraint unqTransaction;

-- Create a new table tblTransaction2 with three columns and a unique constraint
-- This ensures no two records in the new table have the same Amount, DateOfTransaction, and EmployeeNumber
create table tblTransaction2
(
    Amount smallmoney not null,               -- Amount of the transaction, must be filled in
    DateOfTransaction smalldatetime not null, -- Date of the transaction, must be filled in
    EmployeeNumber int not null,              -- Employee's ID number, must be filled in
    CONSTRAINT unqTransaction2 UNIQUE (Amount, DateOfTransaction, EmployeeNumber) -- Enforce uniqueness across the three fields
);

-- Drop (delete) the entire tblTransaction2 table including all data and constraints
drop table tblTransaction2;
