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

-- Modify the XML stored in @x by replacing the value of the Cost attribute
-- Specifically targeting the Cost attribute of the 3rd Item element in the 1st ShoppingTrip element
set @x.modify('replace value of (/Shopping/ShoppingTrip[1]/Item[3]/@Cost)[1]
with "6.0"')

-- Select and display the updated XML variable @x after the modification
select @x

-- Modify the XML by inserting a new Item element with Cost="5" and text "New Food"
-- This new Item is inserted as a child into the 2nd ShoppingTrip element
set @x.modify('insert <Item Cost="5">New Food</Item>
into (/Shopping/ShoppingTrip)[2]')

-- Select and display the XML variable @x after the insert operation
select @x
