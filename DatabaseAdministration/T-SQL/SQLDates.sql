--Setting dates and date extraction
declare @mydate as datetime = '2015-06-24 12:34:56.124'
select @mydate as myDate

declare @mydate2 as datetime2(3) = '20150624 12:34:56.124' --the three means we want three decimal places
select @mydate2 as MyDate

select DATEFROMPARTS(2015,06,24) as ThisDate
select DATETIME2FROMPARTS(2015,06,24,12,34,56,124,3) as ThatDate --the 3 represents the decimal places
select year(@mydate) as myYear, month(@mydate) as myMonth, day(@mydate) as myDay
