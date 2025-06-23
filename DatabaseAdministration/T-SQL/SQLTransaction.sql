begin transaction 

select *
from [dbo].[tblEmployee]

update [dbo].[tblEmployee]
set EmployeeNumber=123
where EmployeeNumber=122

rollback transaction