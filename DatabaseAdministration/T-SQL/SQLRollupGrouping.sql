--ROLLUP, GROUPING and GROUPING_ID
select E.Department, E.EmployeeNumber, A.AttendanceMonth as AttendanceMonth,
-- Select Department, EmployeeNumber, and AttendanceMonth from the joined tables

sum(A.NumberAttendance) as NumberAttendance,
-- Calculate the sum of attendance numbers for the grouped data

GROUPING(E.EmployeeNumber) AS EmployeeNumberGroupedBy,
-- Use GROUPING() function to indicate if EmployeeNumber is aggregated (1) or detailed (0)

GROUPING_ID(E.Department, E.EmployeeNumber, A.AttendanceMonth) AS EmployeeNumberGroupedID
-- Use GROUPING_ID() function to return a numeric value representing which columns are aggregated

from tblEmployee as E join tblAttendance as A
-- Join tblEmployee and tblAttendance tables

on E.EmployeeNumber = A.EmployeeNumber
-- Join condition on EmployeeNumber

group by ROLLUP (E.Department, E.EmployeeNumber, A.AttendanceMonth)
-- Group data with ROLLUP to get subtotals and grand totals by Department, EmployeeNumber, and AttendanceMonth

order by Department, EmployeeNumber, AttendanceMonth
-- Order the result set by Department, EmployeeNumber, and AttendanceMonth
