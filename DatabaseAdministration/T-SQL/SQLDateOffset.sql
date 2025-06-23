--Date offsets
declare @myDateOffset as datetimeoffset(2) = '2015-06-25 01:02:03.456 +05:30' -- 8-10 bytes
select @myDateOffset as MyDateOffset
--datetimeoffset uses 8-10bytes
--datetimeoffset(2) rounds to 2 decimal places
go

declare @myDate as datetime2 = '2015-06-25 01:02:03.456'
select TODATETIMEOFFSET(@myDate,'+05:30') as MyDateOffset --we basically adding the timezone here

select DATETIME2FROMPARTS(2015,06,25,1,2,3,456,3)
--Year, Month, Day = 2015, 6, 25
--Hour, Minute, Second = 1, 2, 3
--Fractions of second = 456 (milliseconds)
--Precision = 3 (up to 3 digits of fractional seconds)

select DATETIMEOFFSETFROMPARTS(2015,06,25,1,2,3,456,5,30,3) as MyDateOffset
--same as the above but now we adding +5:30

select SYSDATETIMEOFFSET() as TimeNowWithOffset;--current system with timezone
select SYSUTCDATETIME() as TimeNowUTC;--Returns the current date and time in UTC, without time zone offset info.

declare @myDateOffset as datetimeoffset = '2015-06-25 01:02:03.456 +05:30'
select SWITCHOFFSET(@myDateOffset,'-05:00') as MyDateOffsetTexas --to change the time zone
