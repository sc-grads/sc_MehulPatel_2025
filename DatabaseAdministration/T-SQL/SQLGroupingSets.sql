--GROUPING SETS
select E.Department, E.EmployeeNumber, A.AttendanceMonth as AttendanceMonth,
-- Select Department, EmployeeNumber, and AttendanceMonth from joined tables

sum(A.NumberAttendance) as NumberAttendance,
-- Calculate the sum of attendance numbers grouped by specified columns

GROUPING(E.EmployeeNumber) AS EmployeeNumberGroupedBy,
-- Use GROUPING() to identify if EmployeeNumber is aggregated (1) or detailed (0)

GROUPING_ID(E.Department, E.EmployeeNumber, A.AttendanceMonth) AS EmployeeNumberGroupedID
-- Use GROUPING_ID() to return a combined numeric value showing which columns are aggregated

from tblEmployee as E join tblAttendance as A
-- Join tblEmployee and tblAttendance tables

on E.EmployeeNumber = A.EmployeeNumber
-- Join condition on EmployeeNumber column

group by GROUPING SETS ((E.Department, E.EmployeeNumber, A.AttendanceMonth),
                       (E.Department), ())
-- Use GROUPING SETS to define multiple groupings:
-- 1) Group by Department, EmployeeNumber, and AttendanceMonth (detailed)
-- 2) Group by Department only (subtotal by department)
-- 3) Empty grouping () for grand total (overall total)

order by coalesce(Department, 'zzzzzzz'), coalesce(E.EmployeeNumber, 99999),
         coalesce(AttendanceMonth,'2100-01-01')
-- Order results while handling NULLs:
-- coalesce replaces NULLs with max sort values so NULLs come last

select E.Department, E.EmployeeNumber, A.AttendanceMonth as AttendanceMonth,
-- Same select statement repeated (likely for clarity or comparison)

sum(A.NumberAttendance) as NumberAttendance,
-- Sum attendance as before

GROUPING(E.EmployeeNumber) AS EmployeeNumberGroupedBy,
-- Identify aggregated EmployeeNumber columns again

GROUPING_ID(E.Department, E.EmployeeNumber, A.AttendanceMonth) AS EmployeeNumberGroupedID
-- Get combined grouping ID value again

from tblEmployee as E join tblAttendance as A
-- Join the same tables

on E.EmployeeNumber = A.EmployeeNumber
-- Same join condition

group by GROUPING SETS ((E.Department, E.EmployeeNumber, A.AttendanceMonth),
                       (E.Department), ())
-- Same grouping sets as above

order by CASE WHEN Department IS NULL THEN 1 ELSE 0 END, Department,
         CASE WHEN E.EmployeeNumber IS NULL THEN 1 ELSE 0 END, E.EmployeeNumber,
         CASE WHEN AttendanceMonth IS NULL THEN 1 ELSE 0 END, AttendanceMonth
-- Order results with NULL values pushed to the end explicitly using CASE statements
