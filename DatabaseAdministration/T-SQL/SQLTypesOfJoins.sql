--Different Types of JOIN
select tblEmployee.EmployeeNumber, EmployeeFirstName, EmployeeLastName, sum(Amount) as SumOfAmount
from tblEmployee left join tblTransaction
on tblEmployee.EmployeeNumber = tblTransaction.EmployeeNumber
GROUP BY tblEmployee.EmployeeNumber, EmployeeFirstName, EmployeeLastName
ORDER BY EmployeeNumber

--from tblEmployee left join tblTransaction
--This is a LEFT JOIN, meaning:
--All employees from tblEmployee are returned.
--If there is no matching transaction, the transaction fields (including Amount) will be NULL.
--on tblEmployee.EmployeeNumber = tblTransaction.EmployeeNumber
--Matches records based on the employee number.
--GROUP BY tblEmployee.EmployeeNumber, EmployeeFirstName, EmployeeLastName
--Groups results so that sum(Amount) is calculated per employee.
--ORDER BY EmployeeNumber
--Sorts the output by employee number in ascending order.


select * from tblEmployee 

select * from tblTransaction where EmployeeNumber = 1046
