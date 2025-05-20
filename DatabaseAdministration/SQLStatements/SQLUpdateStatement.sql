select
Firstname +' '+Lastname as Fullname, --combined the last name and full name
TerritoryName,
TerritoryGroup,
SalesQuota,
salesYTD,
SalesLastYear
into SalesStaff
from
sales.vSalesPerson

select * from [Sales].[vSalesPerson]

select * from SalesStaff

update SalesStaff set SalesQuota=500000.00

update SalesStaff set SalesQuota=SalesQuota+1500000.00
update SalesStaff set SalesQuota=SalesQuota+1500000.00,SalesYTD=SalesYTD-500,SalesLastYear=SalesLastYear*1.50

--we only want to chane specific rows
update SalesStaff set TerritoryName='UK' where TerritoryName='united kingdom'

update SalesStaff set TerritoryName='UK' where Territorygroup is null and fullname='Syed Abbas'
update SalesStaff set TerritoryName='UK',TerritoryGroup='europe' where Territorygroup is null and fullname='Syed Abbas'

--doing a select from another table

update SalesStaff set SalesQuota=sp.SalesQuota
from SalesStaff ss 
inner join sales.vSalesPerson sp
on ss.fullname=(sp.firstname+''+sp.lastname)