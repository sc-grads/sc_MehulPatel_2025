-- Starts a transaction block so changes can be rolled back if needed
BEGIN TRAN  

-- Alters the EmployeeNumber column in tblTransaction to allow NULL values (previously it was NOT NULL)
ALTER TABLE tblTransaction ALTER COLUMN EmployeeNumber INT NULL  

-- Adds a DEFAULT constraint named DF_tblTransaction on EmployeeNumber column
-- If no value is provided during insert, it defaults to 124
ALTER TABLE tblTransaction ADD CONSTRAINT DF_tblTransaction DEFAULT 124 FOR EmployeeNumber  

-- Adds a FOREIGN KEY constraint on EmployeeNumber in tblTransaction referencing EmployeeNumber in tblEmployee
-- WITH NOCHECK means existing data is not validated against this constraint during creation
ALTER TABLE tblTransaction WITH NOCHECK  
ADD CONSTRAINT FK_tblTransaction_EmployeeNumber FOREIGN KEY (EmployeeNumber)  
REFERENCES tblEmployee(EmployeeNumber)  

-- Specifies ON UPDATE CASCADE so if EmployeeNumber changes in tblEmployee, it updates in tblTransaction automatically
ON UPDATE CASCADE  

-- Specifies ON DELETE SET DEFAULT so if a referenced employee is deleted, EmployeeNumber in tblTransaction is set to the default value (124)
ON DELETE SET DEFAULT  

-- (Commented out) Example update statement to change EmployeeNumber 123 to 9123 in tblEmployee
-- UPDATE tblEmployee SET EmployeeNumber = 9123 Where EmployeeNumber = 123  

-- Deletes the employee with EmployeeNumber = 123 from tblEmployee table
DELETE tblEmployee Where EmployeeNumber = 123  

-- Selects EmployeeNumber from tblEmployee and all columns from tblTransaction
-- Uses RIGHT JOIN to include all rows from tblTransaction even if there is no matching employee
SELECT E.EmployeeNumber, T.*  
FROM tblEmployee as E  
RIGHT JOIN tblTransaction as T  
ON E.EmployeeNumber = T.EmployeeNumber  

-- Filters to only show transactions where Amount is one of the listed values
WHERE T.Amount IN (-179.47, 786.22, -967.36, 957.03)  

-- Rolls back all changes made in this transaction, leaving database unchanged
ROLLBACK TRAN  
