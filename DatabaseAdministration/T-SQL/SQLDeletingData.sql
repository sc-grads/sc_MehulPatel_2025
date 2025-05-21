-- Start a new transaction block (ensures changes can be undone)
begin transaction

-- Check how many transactions exist before deletion
select count(*) from tblTransaction

-- Delete transactions that have no matching employee
delete tblTransaction                      -- Delete from tblTransaction
from tblEmployee as E                      -- Use employee table (alias E)
right join tblTransaction as T             -- RIGHT JOIN to get all transactions
on E.EmployeeNumber = T.EmployeeNumber     -- Join condition: match employee numbers
where E.EmployeeNumber is null             -- Condition: keep only those transactions with no matching employee

-- Check how many transactions remain after the delete
select count(*) from tblTransaction

-- Rollback the deletion to avoid making permanent changes (used for testing/auditing)
rollback transaction

-- Confirm that no records were actually deleted after the rollback
select count(*) from tblTransaction




-- Start a new transaction
begin transaction

-- Check how many transactions exist before deletion
select count(*) from tblTransaction

-- Delete transactions with no matching employee using a subquery
delete tblTransaction                      -- Delete from transaction table
from tblTransaction                        -- Source of deletion is tblTransaction
where EmployeeNumber IN                    -- Look for transactions where EmployeeNumber is in the list of "orphaned" employee numbers
(
    select TNumber                         -- Get transaction-side employee numbers that don't match any real employee
    from (
        -- Subquery that attempts to match employees with transactions
        select 
            E.EmployeeNumber as ENumber,       -- Employee number from employee table
            E.EmployeeFirstName,               -- Employee first name
            E.EmployeeLastName,                -- Employee last name
            T.EmployeeNumber as TNumber,       -- Employee number from transaction table
            sum(T.Amount) as TotalAmount       -- Total amount per employee
        from tblEmployee as E
        right join tblTransaction as T         -- Include all transactions, even without matching employees
        on E.EmployeeNumber = T.EmployeeNumber
        group by 
            E.EmployeeNumber,
            T.EmployeeNumber,
            E.EmployeeFirstName,
            E.EmployeeLastName
    ) as newTable                              -- Alias for the subquery
    where ENumber is null                      -- Only include rows where no employee was matched
)

-- Check how many transactions remain after the deletion
select count(*) from tblTransaction

-- Rollback to undo changes (safe practice during testing)
rollback tran

-- Confirm that the data is unchanged after the rollback
select count(*) from tblTransaction
