--String Functions
DECLARE @chrASCII as varchar(10) = 'hellothere'
select @chrASCII

DECLARE @chrUNICODE as nvarchar(10) = N'hello?'
--select @chrASCII

select left(@chrASCII,2) as myASCII, right(@chrUNICODE,2) as myUNICODE
select substring(@chrASCII,3,2) as middleletters --The 3 represents we want the charcters from the third letter and the two says we want to select two characters.
select ltrim(rtrim(@chrASCII)) as myTRIM -- if we have spaces on the left and right of our characters in the quotation marks, we use trim to remove them
select replace(@chrASCII,'l','L') as myReplace
select upper(@chrASCII) as myUPPER
select lower(@chrASCII) as myLOWER
