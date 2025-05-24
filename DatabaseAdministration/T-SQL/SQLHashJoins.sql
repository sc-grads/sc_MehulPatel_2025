-- Perform a LEFT JOIN between tblDepartment (aliased as D) and tblEmployee (aliased as E)
-- This returns all rows from tblDepartment, and matching rows from tblEmployee if available
-- If there is no match, columns from tblEmployee will be NULL
-- The join is likely to use a Hash Match if no indexes exist on the join column (Department)
select *
from [dbo].[tblDepartment] as D
left join [dbo].[tblEmployee] as E
on D.Department = E.Department

-- Select specific columns from the LEFT JOIN of tblDepartment and tblEmployee
-- This query retrieves Department and DepartmentHead from tblDepartment,
-- and EmployeeNumber, EmployeeFirstName, EmployeeLastName from tblEmployee
-- Again, a Hash Match join will occur if appropriate indexes are missing or not used
select D.Department, D.DepartmentHead, E.EmployeeNumber, E.EmployeeFirstName,
E.EmployeeLastName
from [dbo].[tblDepartment] as D
left join [dbo].[tblEmployee] as E
on D.Department = E.Department
