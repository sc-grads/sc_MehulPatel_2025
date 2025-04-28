select * from [dbo].[Employee] 

select * from [dbo].[Sales]

select * from [dbo].[Employee] e  --e and s refer to the table names so we do not have to type out the table names
join [dbo].[Sales] s
on e.empname = s.empname

--the above table our characteristic is not unique so we have to pick a unqiue characteristic.
select * from [dbo].[Employee] e  
join [dbo].[Sales] s
on e.empid = s.empid

select e.empid,e.empname,s.salesnumber,s.itemssold from [dbo].[Employee] e  
join [dbo].[Sales] s
on e.empid = s.empid
order by e.empid

select count(salesnumber) as NoOfSales, e.empname,e.empid from [dbo].[Employee] e 
join [dbo].[Sales] s
on e.empid = s.empid
group by e.empid,e.empname