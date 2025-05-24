declare @x xml

-- Set the @x variable with an XML literal containing shopping info with nested ShoppingTrips and Items, each with Cost attributes or values
set @x= 
'<Shopping ShopperName="Phillip Burton" >
<ShoppingTrip ShoppingTripID="L1" >
<Item Cost="5">Bananas</Item>
<Item Cost="4">Apples</Item>
<Item Cost="3">Cherries</Item>
</ShoppingTrip>
<ShoppingTrip ShoppingTripID="L2" >
<Item>Emeralds</Item>
<Item>Diamonds</Item>
<Item>Furniture</Item>
</ShoppingTrip>
</Shopping>'


--Nodes using variables (shredding a variable) 
-- Select Item name and Cost attribute from XML nodes and insert into a temp table
select 
  -- Extract the text content of the current Item node as 'Item' (the dot '.' means current node's text)
  tbl.col.value('.', 'varchar(50)') as Item,
  
  -- Extract the Cost attribute value of the current Item node as 'Cost'
  tbl.col.value('@Cost', 'varchar(50)') as Cost
  
-- Create a new table 'tblTemp' with these extracted values
into tblTemp

-- Use the .nodes() method on the XML variable @x to shred the XML into rows
from @x.nodes('/Shopping/ShoppingTrip/Item') as tbl(col)

-- Select all rows from the newly created temp table to display results
select * from tblTemp

-- Drop the temp table to clean up after use
drop table tblTemp

-- Comment reminder about XQuery clauses that could be used: for, let, where, order by, return
--for let where order by return
