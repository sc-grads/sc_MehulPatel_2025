--Criteria on summarised data
select left(EmployeeLastName,1) as Initial, count(*) as CountOfInitial --we use the left function to get the first letter of the last name
--doing this we will no longer have a column name
from tblEmployee
group by left(EmployeeLastName,1)
--order by left(EmployeeLastName,1)
order by count(*) DESC 

select top(5) left(EmployeeLastName,1) as Initial, count(*) as CountOfInitial
from tblEmployee
group by left(EmployeeLastName,1)
order by count(*) DESC --left(EmployeeLastName,1)

--only want to output rows where the count is greater than 50
select left(EmployeeLastName,1) as Initial, count(*) as CountOfInitial
from tblEmployee
group by left(EmployeeLastName,1)
having count(*)>=50
order by count(*) DESC --left(EmployeeLastName,1)


select left(EmployeeLastName,1) as Initial, count(*) as CountOfInitial
from tblEmployee
where DateOfBirth > '19860101'
group by left(EmployeeLastName,1)
having count(*)>=20
order by CountOfInitial DESC --can only use aliases in the order by clause

