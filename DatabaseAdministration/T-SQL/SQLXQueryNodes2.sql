-- Declare two XML variables @x1 and @x2
declare @x1 xml, @x2 xml

-- Set @x1 with XML data containing a Shopping element, one ShoppingTrip, and three Items with Cost attributes
set @x1 = '<Shopping ShopperName="Phillip Burton" >
<ShoppingTrip ShoppingTripID="L1" >
<Item Cost="5">Bananas</Item>
<Item Cost="4">Apples</Item>
<Item Cost="3">Cherries</Item>
</ShoppingTrip></Shopping>'

-- Set @x2 with XML data containing a Shopping element, one ShoppingTrip, and three Items without Cost attributes
set @x2 = '<Shopping ShopperName="Phillip Burton" >
<ShoppingTrip ShoppingTripID="L2" >
<Item>Emeralds</Item>
<Item>Diamonds</Item>
<Item>Furniture</Item>
</ShoppingTrip>
</Shopping>'

-- Drop the temporary table #tblXML if it exists (to avoid error on create)
drop table #tblXML

-- Create a temporary table #tblXML with a primary key column and an XML column to hold XML data
create table #tblXML(pkXML INT PRIMARY KEY, xmlCol XML)

-- Insert the first XML variable @x1 into the temporary table with primary key 1
insert into #tblXML(pkXML, xmlCol) VALUES (1, @x1)

-- Insert the second XML variable @x2 into the temporary table with primary key 2
insert into #tblXML(pkXML, xmlCol) VALUES (2, @x2)

-- Select all rows from the temporary table to view stored XML data
select * from #tblXML

-- Extract the Cost attribute from each Item node in the xmlCol column by shredding the XML using CROSS APPLY and nodes()
select tbl.col.value('@Cost','varchar(50)')
from #tblXML
CROSS APPLY xmlCol.nodes('/Shopping/ShoppingTrip/Item') as tbl(col)
