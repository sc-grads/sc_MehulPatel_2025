
select E.Department, E.EmployeeNumber, A.AttendanceMonth as AttendanceMonth,
-- Select Department, EmployeeNumber, and the month of attendance

sum(A.NumberAttendance) as NumberAttendance
-- Calculate the total attendance number for each group

from tblEmployee as E join tblAttendance as A
-- Join employee and attendance tables based on EmployeeNumber

on E.EmployeeNumber = A.EmployeeNumber
-- Join condition: match employee numbers in both tables

group by E.Department, E.EmployeeNumber, A.AttendanceMonth
-- Group results by Department, EmployeeNumber, and AttendanceMonth to get monthly attendance totals

--order by Department, EmployeeNumber, AttendanceMonth
-- (commented out) option to order the results by Department, EmployeeNumber, and AttendanceMonth

UNION
-- Combine the above result with the following results (stack vertically)

select E.Department, E.EmployeeNumber, null as AttendanceMonth, sum(A.NumberAttendance)
as TotalAttendance
-- Select Department, EmployeeNumber, set AttendanceMonth to null to indicate totals, and sum attendance

from tblEmployee as E join tblAttendance as A
-- Join employee and attendance tables again

on E.EmployeeNumber = A.EmployeeNumber
-- Join on EmployeeNumber

group by E.Department, E.EmployeeNumber
-- Group only by Department and EmployeeNumber to get total attendance per employee across all months

union
-- Combine with the next result set

select E.Department, null, null as AttendanceMonth, sum(A.NumberAttendance) as
TotalAttendance
-- Select Department, set EmployeeNumber and AttendanceMonth to null for totals, sum attendance

from tblEmployee as E join tblAttendance as A
-- Join tables again

on E.EmployeeNumber = A.EmployeeNumber
-- Join condition on EmployeeNumber

group by E.Department
-- Group by Department only to get total attendance for each department

union
-- Combine with final result set

select null, null, null as AttendanceMonth, sum(A.NumberAttendance) as TotalAttendance
-- Select null for Department, EmployeeNumber, and AttendanceMonth to show grand total for all employees

from tblEmployee as E join tblAttendance as A
-- Join tables again

on E.EmployeeNumber = A.EmployeeNumber
-- Join condition on EmployeeNumber

order by Department, EmployeeNumber, AttendanceMonth
-- Order the final combined result by Department, EmployeeNumber, and AttendanceMonth
