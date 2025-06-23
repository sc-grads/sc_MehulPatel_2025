-- Select specific columns from the result set
select 
    A.EmployeeNumber,                          -- Get the employee's unique identifier
    A.AttendanceMonth,                         -- Get the month of the attendance record
    A.NumberAttendance,                        -- Get the number of days the employee attended work this month

    -- Calculate the total attendance of all employees (across all months), 
    -- using a window function that sums the NumberAttendance over all rows
    sum(A.NumberAttendance) over() as TotalAttendance,

    -- Calculate the percentage of attendance for this employee-month relative to the total attendance.
    -- Convert the number to a decimal with precision to avoid integer division, 
    -- and multiply by 100 to get a percentage.
    convert(decimal(18,7), A.NumberAttendance) / sum(A.NumberAttendance) over() * 100.0000 as PercentageAttendance

-- Define which tables to select data from
from tblEmployee as E                         -- Define alias 'E' for tblEmployee to simplify references
join tblAttendance as A                       -- Define alias 'A' for tblAttendance
on E.EmployeeNumber = A.EmployeeNumber        -- Join both tables on EmployeeNumber to combine employee and attendance data

-- Aggregate query to find the total number of attendance records across all employees and months
select sum(NumberAttendance) from tblAttendance
