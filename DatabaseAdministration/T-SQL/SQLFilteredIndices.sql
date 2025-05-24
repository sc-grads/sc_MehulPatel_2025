-- Create a non-clustered filtered index on the EmployeeNumber column in the tblEmployee table
-- This index only includes rows where EmployeeNumber is less than 139, which can improve performance and reduce index size
CREATE NONCLUSTERED INDEX idx_tblEmployee_Employee
ON dbo.tblEmployee(EmployeeNumber) where EmployeeNumber < 139;
