--Get the total transaction amount made by each employee.
select EmployeeNumber, sum(Amount) as TotalAmount
from tblTransaction
group by EmployeeNumber

-- Joining Employee and Transaction Tables
select *
from tblEmployee
join tblTransaction
on tblEmployee.EmployeeNumber = tblTransaction.EmployeeNumber
--on tblEmployee.EmployeeNumber = tblTransaction.EmployeeNumber
--Specifies the join condition: rows are matched where the employee number is the same in both tables.

select tblEmployee.EmployeeNumber, EmployeeFirstName, EmployeeLastName, sum (Amount) as SumOfAmount
from tblEmployee
join tblTransaction
on tblEmployee.EmployeeNumber = tblTransaction.EmployeeNumber
group by tblEmployee.EmployeeNumber, EmployeeFirstName, EmployeeLastName
order by EmployeeNumber

--select tblEmployee.EmployeeNumber, EmployeeFirstName, EmployeeLastName, sum(Amount) as SumOfAmount
--Selects the employee's number, first and last name, and the total transaction amount.
--from tblEmployee
--Main table is employee data.
--join tblTransaction
--Join with the transactions table.
--on tblEmployee.EmployeeNumber = tblTransaction.EmployeeNumber
--Match records by employee number.
--group by tblEmployee.EmployeeNumber, EmployeeFirstName, EmployeeLastName
--Since we are using sum(), we must group by all the non-aggregated columns.
--order by EmployeeNumber
--Sorts the results by employee number.

select *
from tblEmployee
where EmployeeNumber =1046