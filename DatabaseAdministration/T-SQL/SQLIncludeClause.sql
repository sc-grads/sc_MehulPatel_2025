-- Create a non-clustered index on the EmployeeNumber column in the tblEmployee table
-- The INCLUDE clause adds EmployeeFirstName as a non-key column, allowing queries to retrieve it without a lookup
CREATE NONCLUSTERED INDEX idx_tblEmployee_Employee
ON dbo.tblEmployee(EmployeeNumber) include (EmployeeFirstName);

-- Drop the non-clustered index named idx_tblEmployee_Employee from the tblEmployee table
DROP INDEX idx_tblEmployee_Employee ON dbo.tblEmployee
