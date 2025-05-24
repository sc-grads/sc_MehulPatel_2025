-- Select all columns from the tblTransaction table (aliased as T)
select T.*
from tblTransaction as T

-- Perform a RIGHT JOIN to include all rows from tblEmployee (aliased as E)
-- and matching rows from tblTransaction based on EmployeeNumber
right join tblEmployee as E
on T.EmployeeNumber = E.EmployeeNumber

-- Filter results to only include employees with EmployeeNumber between 120 and 299
where E.EmployeeNumber between 120 and 299

-- Further filter to only include rows where the matching EmployeeNumber exists in tblTransaction
-- This excludes rows where tblTransaction.EmployeeNumber is NULL (no match found)
and T.EmployeeNumber is not null
