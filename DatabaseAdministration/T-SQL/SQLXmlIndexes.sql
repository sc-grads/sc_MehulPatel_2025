-- Declare two XML variables to store shopping data

declare @x1 xml, @x2 xml


-- Set @x1 with XML containing a Shopping element with one ShoppingTrip (ID = L1) and three Items with Cost attributes

set @x1='&lt;Shopping ShopperName="Phillip Burton" &gt;

&lt;ShoppingTrip ShoppingTripID="L1" &gt;

&lt;Item Cost="5"&gt;Bananas&lt;/Item&gt;

&lt;Item Cost="4"&gt;Apples&lt;/Item&gt;

&lt;Item Cost="3"&gt;Cherries&lt;/Item&gt;

&lt;/ShoppingTrip&gt;&lt;/Shopping&gt;'


-- Set @x2 with XML containing a second ShoppingTrip (ID = L2) with three Items, one of which has a nested Color element

set @x2='&lt;Shopping ShopperName="Phillip Burton" &gt;

&lt;ShoppingTrip ShoppingTripID="L2" &gt;

&lt;Item&gt;Emeralds&lt;/Item&gt;

&lt;Item&gt;Diamonds&lt;/Item&gt;

&lt;Item&gt;Furniture

&lt;Color&gt;&lt;/Color&gt;&lt;/Item&gt;

&lt;/ShoppingTrip&gt;

&lt;/Shopping&gt;'


-- Drop temporary table if it already exists

drop table #tblXML;


-- Create a temporary table with a primary key and an XML column

create table #tblXML(pkXML INT PRIMARY KEY, xmlCol XML)


-- Insert the first XML document into the table with primary key 1

insert into #tblXML(pkXML, xmlCol) VALUES (1, @x1)


-- Insert the second XML document into the table with primary key 2

insert into #tblXML(pkXML, xmlCol) VALUES (2, @x2)


-- Create a primary XML index on the xmlCol column to optimize XML queries

create primary xml index pk_tblXML on #tblXML(xmlCol)


-- Create a secondary XML index for PATH queries using the primary XML index

create xml index secpk_tblXML_Path on #tblXML(xmlCol)

using xml index pk_tblXML FOR PATH


-- Create a secondary XML index for VALUE queries (value-based searches) using the primary XML index

create xml index secpk_tblXML_Value on #tblXML(xmlCol)

using xml index pk_tblXML FOR VALUE


-- Create a secondary XML index optimized for PROPERTY access using the primary XML index

create xml index secpk_tblXML_Property on #tblXML(xmlCol)

using xml index pk_tblXML FOR PROPERTY