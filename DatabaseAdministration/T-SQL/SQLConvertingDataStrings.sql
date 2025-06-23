--Converting from dates to strings

declare @mydate as datetime = '2015-06-25 01:02:03.456'
select 'The date and time is: ' + @mydate
go --this is not going to work,to solve it we are going to do the following.


declare @mydate as datetime = '2015-06-25 01:02:03.456'
select 'The date and time is: ' + convert(nvarchar(20),@mydate,104) as MyConvertedDate --we converting the date time value to a string
go

declare @mydate as datetime = '2015-06-25 01:02:03.456'
select cast(@mydate as nvarchar(20)) as MyCastDate --Converts the datetime to a string without specifying a style 

select try_convert(date,'Thursday, 25 June 2015') as MyConvertedDate
--Tries to convert a string with a full day and date format to a date. If it fails, it returns NULL instead of an error.

select parse('Thursday, 25 June 2015' as date) as MyParsedDate
--Converts a string to a specified data type using .NET culture-aware parsing.

select parse('Jueves, 25 de junio de 2015' as date using 'es-ES') as MySpanishParsedDate
--Parses the Spanish-language string using the es-ES (Spanish-Spain) locale

select format(cast('2015-06-25 01:02:03.456' as datetime),'D') as MyFormattedLongDate --long format because of D
select format(cast('2015-06-25 01:02:03.456' as datetime),'d') as MyFormattedShortDate --short format because of d

--custom format
select format(cast('2015-06-25 01:59:03.456' as datetime),'dd-MM-yyyy') as MyFormattedBritishDate

select format(cast('2015-06-25 01:02:03.456' as datetime),'D','zh-CN') as MyFormattedInternationalLongDate
--Applies long date format using the Chinese locale 'zh-CN'