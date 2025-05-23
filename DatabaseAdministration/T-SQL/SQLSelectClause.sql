-- Select all columns from tblEmployee
Select *, 

       -- Correlated subquery #1:
       -- Counts how many transactions exist for each employee
       (select count(EmployeeNumber)
        from tblTransaction as T
        where T.EmployeeNumber = E.EmployeeNumber) as NumTransactions,

       -- Correlated subquery #2:
       -- Sums the transaction amounts for each employee
       (select sum(Amount)
        from tblTransaction as T
        where T.EmployeeNumber = E.EmployeeNumber) as TotalAmount

-- Main table: employees
from tblEmployee as E

-- Filter only those employees whose last name starts with 'y'
Where E.EmployeeLastName like 'y%'
