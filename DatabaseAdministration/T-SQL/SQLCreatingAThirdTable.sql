--Creating a third table
select Department as NumberOfDepartments --Selects the Department column, but renames it (alias) as NumberOfDepartments.
into tblDepartment2 --This creates a new table called tblDepartment2 and inserts the results of the query into it.
from
(select Department, count(*) as NumberPerDepartment --Groups all employees by Department.
from tblEmployee
GROUP BY Department) as newTable

--derived table

select distinct Department, convert(varchar(20), N'') as DepartmentHead --we adding a scond coloumn to the collection
into tblDepartment --Creates a new table called tblDepartment with two columns: Department and DepartmentHead.
from tblEmployee

drop table tblDepartment

select * from tblDepartment

alter table tblDepartment
alter column DepartmentHead varchar(30) null
