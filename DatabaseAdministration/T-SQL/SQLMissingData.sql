-- Select employee details and related transaction details
select 
    E.EmployeeNumber as ENumber,           -- Employee number from employee table, alias as ENumber
    E.EmployeeFirstName,                   -- First name of the employee
    E.EmployeeLastName,                    -- Last name of the employee
    T.EmployeeNumber as TNumber,           -- Employee number from transaction table, alias as TNumber
    sum(T.Amount) as TotalAmount           -- Sum of transaction amounts (will be NULL for no transactions)
from tblEmployee as E                      -- From employee table, alias as E
left join tblTransaction as T              -- LEFT JOIN with transaction table (includes all employees even if no transaction)
on E.EmployeeNumber = T.EmployeeNumber     -- Join condition: employee numbers must match
where T.EmployeeNumber IS NULL             -- Filter: only include employees who have no matching transactions
group by 
    E.EmployeeNumber,                      -- Group by employee fields and transaction employee number
    T.EmployeeNumber, 
    E.EmployeeFirstName,
    E.EmployeeLastName
order by 
    E.EmployeeNumber,                      -- Order results by employee number and names
    T.EmployeeNumber, 
    E.EmployeeFirstName,
    E.EmployeeLastName;

--What it's doing:
--List all employees.
--Check if they do NOT have any matching transactions.
--A LEFT JOIN includes all employees.
--The IS NULL filters out the ones who did not match any transactions, meaning: "no transactions".






-- Select employee details from a subquery that aggregates transactions
select 
    ENumber,                               -- Employee number from subquery
    EmployeeFirstName,                     -- First name from subquery
    EmployeeLastName                       -- Last name from subquery
from (
    -- Subquery that calculates total transaction amounts for each employee
    select 
        E.EmployeeNumber as ENumber,       
        E.EmployeeFirstName,               
        E.EmployeeLastName,               
        T.EmployeeNumber as TNumber,       
        sum(T.Amount) as TotalAmount       
    from tblEmployee as E                 
    left join tblTransaction as T         
    on E.EmployeeNumber = T.EmployeeNumber 
    group by 
        E.EmployeeNumber,                 
        T.EmployeeNumber, 
        E.EmployeeFirstName,
        E.EmployeeLastName
) as newTable                              -- Give a name to the subquery result
where TNumber is null                      -- Filter: select only rows where there is no transaction (TNumber is null)
order by 
    ENumber,                               -- Order the results by employee number and names
    TNumber, 
    EmployeeFirstName,
    EmployeeLastName;

--What it's doing:
--Same as the first query, but done in two steps:
--First, combine employees with transactions (or null if none).
--Then, from that result, pick only those without transactions.



-- Select all transaction details where there is no matching employee
select *                                   -- Select all columns from the subquery
from (
    -- Subquery that groups transaction amounts with employee info (if exists)
    select 
        E.EmployeeNumber as ENumber,       
        E.EmployeeFirstName,               
        E.EmployeeLastName,                
        T.EmployeeNumber as TNumber,       
        sum(T.Amount) as TotalAmount       
    from tblEmployee as E                 
    right join tblTransaction as T         -- RIGHT JOIN: include all transactions even if no employee match
    on E.EmployeeNumber = T.EmployeeNumber 
    group by 
        E.EmployeeNumber,                 
        T.EmployeeNumber, 
        E.EmployeeFirstName,
        E.EmployeeLastName
) as newTable                              -- Name the subquery result
where ENumber is null                      -- Filter: include only rows where there is no matching employee
order by 
    ENumber,                               -- Order the result (ENumber will be null)
    TNumber, 
    EmployeeFirstName,
    EmployeeLastName;

--What it's doing:
--List all transactions.
--Find any that do NOT belong to a known employee.
--Why use RIGHT JOIN + IS NULL?
--To catch orphaned transactions – maybe data was entered incorrectly or the employee was deleted.