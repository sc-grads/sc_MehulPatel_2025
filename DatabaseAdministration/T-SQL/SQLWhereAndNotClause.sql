--Subquery – WHERE and NOT
select *  -- Selects all columns from the result set
from tblTransaction as T  -- From the tblTransaction table, aliased as T
Where EmployeeNumber in  -- Filters for EmployeeNumbers that exist in the following subquery
    (Select EmployeeNumber from tblEmployee where EmployeeLastName not like 'y%')  
    -- Subquery: Selects EmployeeNumbers from tblEmployee where last names do NOT start with 'y'
order by EmployeeNumber  -- Orders the result by EmployeeNumber in ascending order
                         -- must be in tblEmployee AND tblTransaction, and not 126-129
                         -- INNER JOIN

select *  -- Selects all columns from the result set
from tblTransaction as T  -- From the tblTransaction table, aliased as T
Where EmployeeNumber not in  -- Filters for EmployeeNumbers that are NOT in the following subquery
    (Select EmployeeNumber from tblEmployee where EmployeeLastName like 'y%')  
    -- Subquery: Selects EmployeeNumbers from tblEmployee where last names start with 'y'
order by EmployeeNumber  -- Orders the result by EmployeeNumber in ascending order
                         -- must be in tblTransaction, and not 126-129
                         -- LEFT JOIN
