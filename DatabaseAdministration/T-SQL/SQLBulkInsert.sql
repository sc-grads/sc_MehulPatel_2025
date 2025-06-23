--42. Builk insert and openrowset

-- Drop the temporary table #tblXML if it exists

drop table #tblXML

go


-- Create a new temporary table #tblXML with one column XmlCol of type XML

create table #tblXML(XmlCol xml)

go


-- Bulk insert data from the file 'C:\XML\SampleDataBulkInsert.txt' into #tblXML

bulk insert #tblXML from 'C:\XML\SampleDataBulkInsert.txt'


-- Select all rows from #tblXML to view the inserted XML data

select * from #tblXML


-- Drop the temporary table #tblXML to clean up

drop table #tblXML

go


-- Create a new temporary table #tblXML with two columns: IntCol (int) and XmlCol (xml)

create table #tblXML(IntCol int, XmlCol xml)

go


-- Insert XML data into #tblXML by reading from the file 'C:\XML\SampleDataOpenRowset.txt' using OPENROWSET with SINGLE_BLOB option

insert into #tblXML(XmlCol)

select * from

openrowset(BULK 'C:\XML\SampleDataOpenRowset.txt', SINGLE_BLOB) AS x


-- Select all rows from #tblXML to see the inserted data

select * from #tblXML