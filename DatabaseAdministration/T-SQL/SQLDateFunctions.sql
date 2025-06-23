

SELECT CURRENT_TIMESTAMP as RightNow --standard version of this
select getdate() as RightNow -- microsoft created this, this is a datetime even the one above because the last number is a 0,3 or 7
select SYSDATETIME() AS RightNow--more accurate


select dateadd(year,1,'2015-01-02 03:04:05') as myYear --adding a year
select datepart(hour,'2015-01-02 03:04:05') as myHour --this extracts the time

select datename(weekday, getdate()) as myAnswer
select datediff(second,'2015-01-02 03:04:05',getdate()) as SecondsElapsed --gives the number of seconds from this date to now
