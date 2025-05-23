-- Select all columns from a derived table that includes ranked employees per department
select * 
from (
    -- Inner query: Join departments and employees, and rank employees within each department
    select 
        D.Department,                   -- Department name or ID
        EmployeeNumber,                -- Unique employee ID
        EmployeeFirstName,             -- First name
        EmployeeLastName,              -- Last name

        -- Window function: assigns a rank to each employee within their department
        rank() over (
            partition by D.Department  -- Start a new ranking for each department
            order by E.EmployeeNumber  -- Order employees by EmployeeNumber within each department
        ) as TheRank

    from tblDepartment as D 
    join tblEmployee as E 
        on D.Department = E.Department  -- Join on the common department field
) as MyTable

-- Outer query: Filter the ranked employees to only include the top 5 per department
where TheRank <= 5

-- Order the final result by department and then by employee number
order by Department, EmployeeNumber
