--XQuery Query and FLWOR 1 
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


-- Use the .query() method to return XML fragments for each Item element under all ShoppingTrip elements
select @x.query('for $ValueRetrieved in /Shopping/ShoppingTrip/Item
return $ValueRetrieved')

-- Use the .query() method to return the string values (text content) of each Item element under all ShoppingTrip elements
select @x.query('for $ValueRetrieved in /Shopping/ShoppingTrip/Item
return string($ValueRetrieved)')

-- Use the .query() method to return concatenated string values of each Item element under the first ShoppingTrip, adding a semicolon after each item
select @x.query('for $ValueRetrieved in /Shopping/ShoppingTrip[1]/Item
return concat(string($ValueRetrieved),";")')
