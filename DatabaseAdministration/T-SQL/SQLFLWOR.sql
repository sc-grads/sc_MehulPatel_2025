--XQuery Query and FLWOR 2 
-- Use the .query() method to execute an XQuery FLWOR expression on XML variable @x

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


select @x.query('
  -- For each Item element within the first ShoppingTrip element
  for $ValueRetrieved in /Shopping/ShoppingTrip[1]/Item
  
  -- Assign the Cost attribute of the current Item element to the variable $CostVariable
  let $CostVariable := $ValueRetrieved/@Cost
  
  -- Filter to include only those Item elements where the Cost attribute value is greater than or equal to 4
  where $CostVariable >= 4
  
  -- Order the results by the Cost attribute in ascending order
  order by $CostVariable
  
  -- Return a concatenated string of the Item's text content plus a semicolon
  return concat(string($ValueRetrieved),";")
')
