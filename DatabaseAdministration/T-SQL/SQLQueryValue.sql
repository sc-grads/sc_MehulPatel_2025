-- Declare an XML variable named @x
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

-- Use the .value() method of the XML datatype to extract a scalar value from the XML
-- The XQuery expression '(/Shopping/ShoppingTrip/Item/@Cost)[1]' selects the first 'Cost' attribute from the first Item element inside ShoppingTrip elements
-- 'varchar(50)' specifies the SQL type to cast the returned XML value into a string of max length 50
select @x.value('(/Shopping/ShoppingTrip/Item/@Cost)[1]', 'varchar(50)')
