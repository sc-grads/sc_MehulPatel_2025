select * from tblEmployee
where [EmployeeLastName] <> 'Word' -- we want all employees who's last name is not equal to word


select * from tblEmployee
where [EmployeeLastName] < 'Word' --we want all the employees last names who come before the word

select * from tblEmployee
where [EmployeeLastName] like 'W%'-- we want all the employees who's last name starts with w

select * from tblEmployee
where [EmployeeLastName] like 'W%'-- there must be at least one w in the word 

select * from tblEmployee
where [EmployeeLastName] like '_W%' -- outputs thwe names whos second letter is w

Select * from tblEmployee
where [EmployeeLastName] like '[r-t]%' --looks for any employee whos name starts with a r,s,t

Select * from tblEmployee
where [EmployeeLastName] like '[^rst]%' -- not rst

-- % = 0-infinity characters
-- _ = 1 character
-- [A-G] = In the range A-G.
-- [AGQ] = A, G or Q.
-- [^AGQ] = NOT A, G or Q.

select * from tblEmployee
where EmployeeLastName like '[%]%' --looking for names that start with a percentage sign

select * from tblEmployee
where EmployeeLastName like '`%%' ESCAPE '`'
