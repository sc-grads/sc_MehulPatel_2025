Create procedure SelectAllPersonAddress
As
select * from person.address
go;

execute SelectAllPersonAddress

drop procedure SelectAllPersonAddress

Create procedure SelectAllPersonAddressWithParams (@city nvarchar(30))
As

--begin
Set nocount on

select * from person.address where city=@city;
--end

execute SelectAllPersonAddressWithParams @city = 'Miami'

--passing the parameter
Create procedure SelectAllPersonAddressWithParams (@city nvarchar(30)= 'New York')
As

--begin
Set nocount on

select * from person.address where city=@city;
--end

execute SelectAllPersonAddressWithParams @city = 'Miami' --note that this will overide 'New York' and will output the city-miami

--encrypting the stored procedure

Create procedure SelectAllPersonAddressWithParamswithEncryption (@city nvarchar(30)= 'New York')
WITH ENCRYPTION
As

--begin
Set nocount on

select * from person.address where city=@city;
--end

execute SelectAllPersonAddressWithParams @city = 'Miami' --note that this will overide 'New York' and will output the city-miami

