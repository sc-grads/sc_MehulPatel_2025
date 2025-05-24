-- Declare a variable @x of type XML to hold XML data
declare @x xml

-- Set the @x variable to a literal XML string describing shopping info with shopper name, weather, shopping trips, and items
set @x = '<Shopping ShopperName="Phillip Burton" Weather="Nice">
<ShoppingTrip ShoppingTripID="L1">
<Item Cost="5">Bananas</Item>
<Item Cost="4">Apples</Item>
<Item Cost="3">Cherries</Item>
</ShoppingTrip>
<ShoppingTrip ShoppingTripID="L2">
<Item>Emeralds</Item>
<Item>Diamonds</Item>
<Item>Furniture</Item>
</ShoppingTrip>
</Shopping>'

-- Select the XML data stored in @x to display it
select @x as XMLOutput


-- Update the dbo.tblEmployee table, setting the XMLOutput column to the XML value @x for the row where EmployeeNumber is 200
update [dbo].[tblEmployee]
set XMLOutput = @x
where EmployeeNumber = 200

-- Select all columns from dbo.tblEmployee to show the updated data including the new XML content
select * from [dbo].[tblEmployee]
