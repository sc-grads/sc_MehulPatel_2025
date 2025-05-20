SELECT sum(rate)
  FROM [AdventureWorks2022].[HumanResources].[EmployeePayHistory]

print upper('dotnet')
print lower('doVVVet')

print convert(int,15.5)

print getdate()

print year(getdate())

create table FunctionEmployee
( 
EmpID int primary key,
FirstName varchar(50) null,
LastName varchar(50) null,
Salary int null,
Address varchar(100) null
)

insert into FunctionEmployee (EmpID,FirstName,LastName,Salary,Address) Values (1,'Abbas','Mehmood', 20000, 'Delhi') 
insert into FunctionEmployee (EmpID,FirstName,LastName,Salary,Address) values (2,'Imran','Afzal', 50000, 'Delhi')
insert into FunctionEmployee (EmpID,FirstName,LastName,Salary,Address) values (3,'James','Dino', 90000, 'Delhi')
insert into FunctionEmployee (EmpID,FirstName,LastName,Salary,Address) values (4,'Jaga','Babu', 70000, 'Delhi')

select * from FunctionEmployee

Create function fnGetEmpFullName
(@firstname varchar(50),@lastname varchar(50))
returns varchar (101)
as
begin
return(select @firstname +''+@lastname);
end

select dbo.fnGetEmpFullName (firstname,lastname) as Fullname, salary from FunctionEmployee

--inline value function

create function fnGetEmployee()
returns table 
as 
return (select *from FunctionEmployee)

select * from dbo.FunctionEmployee
SELECT * FROM fnGetEmployee()

--multi statment table valued function.

create function [dbo].[fnGetMulEmployee]()
returns @Emp Table
(
Empid int,
FirstName varchar(50),
Salary int
)
As
Begin
 Insert into @Emp Select e.EmpID,e.FirstName,e.Salary from FunctionEmployee e;
--Now update salary of first employee
 update @Emp set Salary=25000 where EmpID=1;
--It will update only in @Emp table not in Original Employee table
return
end 
GO

select * from dbo.fnGetMulEmployee()