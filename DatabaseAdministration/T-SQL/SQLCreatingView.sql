-- Selects the number 1 as a simple test to ensure SQL is running
select 1  

-- 'go' signals the end of a batch of SQL commands (specific to SQL Server tools like SSMS)
go  

-- Creates a view named 'ViewByDepartment' to show department-wise transaction details
create view ViewByDepartment as  

-- Selects department name, employee number, transaction date, and amount (renamed as TotalAmount)
select D.Department, T.EmployeeNumber, T.DateOfTransaction, T.Amount as TotalAmount  

-- From the department table (aliased as D)
from tblDepartment as D  

-- Left join means keep all departments, even if there are no matching employees
left join tblEmployee as E  
on D.Department = E.Department  -- Join condition: match departments between the two tables

-- Another left join to include all employees even if they have no transactions
left join tblTransaction as T  
on E.EmployeeNumber = T.EmployeeNumber  -- Join condition: match employee numbers

-- Filter to include only transactions for employees numbered between 120 and 139
where T.EmployeeNumber between 120 and 139  

-- Optional sorting of results, currently commented out
--order by D.Department, T.EmployeeNumber  

-- End of the view creation batch
go  

-- Creates another view named 'ViewSummary' to show total amount per employee in each department
create view ViewSummary as  

-- Selects department name, employee number (renamed as EmpNum), and sum of transaction amounts
select D.Department, T.EmployeeNumber as EmpNum, sum(T.Amount) as TotalAmount  

-- Again, starting from the department table
from tblDepartment as D  

-- Left join to include all departments even if there are no employees
left join tblEmployee as E  
on D.Department = E.Department  -- Join departments

-- Left join to include all employees even if they have no transactions
left join tblTransaction as T  
on E.EmployeeNumber = T.EmployeeNumber  -- Join employee transactions

-- Grouping by department and employee number to calculate total per employee
group by D.Department, T.EmployeeNumber  

-- Optional sorting, currently commented out
--order by D.Department, T.EmployeeNumber  

-- End of this batch
go  

-- Display all records from the ViewByDepartment view
select * from ViewByDepartment  

-- Display all records from the ViewSummary view
select * from ViewSummary  
