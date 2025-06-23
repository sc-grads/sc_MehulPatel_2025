-- Select all rows from the user-defined function TransList for EmployeeNumber 123
SELECT *
from dbo.TransList(123)
GO

-- Select all employees and add a column showing the count of transactions for each employee using a scalar subquery
select *, (select count(*) from dbo.TransList(E.EmployeeNumber)) as NumTransactions
from tblEmployee as E

-- Select all columns from tblEmployee and outer apply the TransList function for each employee,
-- including employees with zero transactions (like a LEFT JOIN)
select *
from tblEmployee as E
outer apply TransList(E.EmployeeNumber) as T

-- Select all columns from tblEmployee and cross apply the TransList function for each employee,
-- only including employees who have at least one transaction (like an INNER JOIN)
select *
from tblEmployee as E
cross apply TransList(E.EmployeeNumber) as T

-- Comments explaining APPLY behavior:
-- 123 left join TransList(123)
-- 124 left join TransList(124)
-- outer apply returns all rows from tblEmployee and matches rows from UDF (0 or more rows)
-- cross apply returns rows from tblEmployee only if UDF returns 1 or more rows
-- outer apply behaves like a LEFT JOIN
-- cross apply behaves like an INNER JOIN

-- Select all employees where the number of transactions is greater than 3, using a scalar subquery
select *
from tblEmployee as E
where (select count(*) from dbo.TransList(E.EmployeeNumber)) > 3
