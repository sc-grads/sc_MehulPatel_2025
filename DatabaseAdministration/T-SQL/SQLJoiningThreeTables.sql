--JOINING three tables
select DepartmentHead, sum(Amount) as SumOfAmount --Calculates the total transaction amount (sum(Amount)) from tblTransaction, grouped by department head.
from tblDepartment --Starts with tblDepartment as the base table.
left join tblEmployee
on tblDepartment.Department = tblEmployee.Department
left join tblTransaction
--Joins tblEmployee to associate employees with their department.
--A LEFT JOIN ensures all departments appear, even those with no employees.
on tblEmployee.EmployeeNumber = tblTransaction.EmployeeNumber --Joins tblTransaction to bring in transaction data related to each employee.
group by DepartmentHead
order by DepartmentHead

insert into tblDepartment(Department,DepartmentHead) --adding a new row
values ('Accounts', 'James')

select D.DepartmentHead, Sum(T.Amount) as SumOfAmount
from tblDepartment as D
left join tblEmployee as E
on D.Department = E.Department
left join tblTransaction T
on E.EmployeeNumber = T.EmployeeNumber
group by D.DepartmentHead
order by D.DepartmentHead
