--Summarising an ordering data
select * from tblEmployee
where DateOfBirth between '19760101' and '19861231' --this will exclude people born on the 31st of December

select * from tblEmployee
where DateOfBirth >= '19760101' and DateOfBirth < '19870101'

select * from tblEmployee
where year(DateOfBirth) between 1976 and 1986  -- DO NOT USE.

SELECT year(DateOfBirth) as YearOfDateOfBirth, count(*) as NumberBorn
FROM tblEmployee
GROUP BY year(DateOfBirth)-- without this we get an error.
--This is crucial in aggregation queries.
--It tells SQL to group rows based on the result of year(DateOfBirth).
--All rows with the same birth year will be grouped together, so that the count(*) can count how many employees were born in each year.

SELECT * FROM tblEmployee
where year(DateOfBirth) = 1967

--Below is the order we have to put it in
--SQL executes it, but it exexcutes the select statement last
SELECT year(DateOfBirth) as YearOfDateOfBirth, count(*) as NumberBorn
FROM tblEmployee
WHERE 1=1
GROUP BY year(DateOfBirth)
-- non-deterministic

SELECT year(DateOfBirth) as YearOfDateOfBirth, count(*) as NumberBorn
FROM tblEmployee
WHERE 1=1
GROUP BY year(DateOfBirth)
ORDER BY year(DateOfBirth) DESC --if we have alot of data we might not get the same order so we use this.
