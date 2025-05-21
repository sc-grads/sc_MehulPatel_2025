-- Adds a PRIMARY KEY constraint named PK_tblEmployee on EmployeeNumber column of tblEmployee table
-- Primary key uniquely identifies each row and ensures no duplicates and not null values in EmployeeNumber
alter table tblEmployee  
add constraint PK_tblEmployee PRIMARY KEY (EmployeeNumber)  


-- Inserts a new employee record with specified details into tblEmployee
insert into tblEmployee(EmployeeNumber, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName,  
                       EmployeeGovernmentID, DateOfBirth, Department)  
values (2004, 'FirstName', 'MiddleName', 'LastName', 'AB12345FI', '2014-01-01', 'Accounts')  


-- Deletes the employee record where EmployeeNumber equals 2004
delete from tblEmployee  
where EmployeeNumber = 2004  


-- Drops the primary key constraint PK_tblEmployee from tblEmployee table
alter table tblEmployee  
drop constraint PK_tblEmployee  


-- Creates a new table tblEmployee2 with two columns:
-- EmployeeNumber as an auto-incremented primary key (IDENTITY(1,1) means start at 1, increment by 1)
-- EmployeeName as a nvarchar(20) column to store employee names
create table tblEmployee2  
(EmployeeNumber int CONSTRAINT PK_tblEmployee2 PRIMARY KEY IDENTITY(1,1),  
 EmployeeName nvarchar(20))  


-- Inserts two rows into tblEmployee2 table with EmployeeName values only
-- EmployeeNumber will be automatically generated because of IDENTITY property
insert into tblEmployee2  
values ('My Name'),  
       ('My Name')  


-- Selects all records from tblEmployee2 to view inserted data
select * from tblEmployee2  


-- Deletes all rows from tblEmployee2 table (data removed, but table structure remains)
delete from tblEmployee2  


-- Truncates tblEmployee2, which deletes all rows and resets the identity counter to start from 1 again
truncate table tblEmployee2  


-- Inserts two new rows into tblEmployee2 again after truncation
insert into tblEmployee2(EmployeeNumber, EmployeeName)  
values (3, 'My Name'), (4, 'My Name')  


-- Turns ON IDENTITY_INSERT for tblEmployee2 which allows explicit insertion into the identity column (EmployeeNumber)
SET IDENTITY_INSERT tblEmployee2 ON  


-- Inserts two rows with specific EmployeeNumber values 38 and 39 explicitly into tblEmployee2
insert into tblEmployee2(EmployeeNumber, EmployeeName)  
values (38, 'My Name'), (39, 'My Name')  


-- Turns OFF IDENTITY_INSERT to revert to automatic identity value generation
SET IDENTITY_INSERT tblEmployee2 OFF  


-- Drops the table tblEmployee2 and all its data permanently
drop table tblEmployee2  


-- Returns the last identity value generated on the current connection across any table
select @@IDENTITY  


-- Returns the last identity value generated in the current scope (safer than @@IDENTITY)
select SCOPE_IDENTITY()  


-- Returns the last identity value generated for the specified table, regardless of connection or scope
select IDENT_CURRENT('dbo.tblEmployee2')  


-- Creates a new table tblEmployee3 similar to tblEmployee2 with an identity primary key and EmployeeName column
create table tblEmployee3  
(EmployeeNumber int CONSTRAINT PK_tblEmployee3 PRIMARY KEY IDENTITY(1,1),  
 EmployeeName nvarchar(20))  


-- Inserts two rows into tblEmployee3; EmployeeNumber will auto-increment
insert into tblEmployee3  
values ('My Name'),  
       ('My Name')  
