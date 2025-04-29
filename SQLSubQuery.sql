--select * from [HumanResources].[EmployeePayHistory]

-- all tables are created in the dbo schema unless we create a new schema.

--select * from [Employee] since the schema is dbo we don't have to say dbo.Employee

select * from [HumanResources].[EmployeePayHistory]
where BusinessEntityID IN (select BusinessEntityID from [HumanResources].[EmployeePayHistory] where rate > 60) 

select * from [HumanResources].[EmployeePayHistory]
where BusinessEntityID =(select BusinessEntityID from [HumanResources].[EmployeePayHistory] where rate = 39.06)

select * from [Production].[Product]
where ProductID IN (Select ProductID from [Production].[ProductInventory] where quantity >300)


select * from [Production].[ProductInventory]

