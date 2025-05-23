-- Select relevant attendance information along with lag, lead, and difference analysis
select 
    A.EmployeeNumber,                -- Employee's unique number
    A.AttendanceMonth,              -- The month of the attendance record
    A.NumberAttendance,             -- Number of attendances recorded in that month

    -- Get the previous month's NumberAttendance (1 row before the current row in the partition)
    lag(NumberAttendance, 1)  
    over(
        partition by E.EmployeeNumber           -- Partition by employee to treat each separately
        order by A.AttendanceMonth              -- Order records chronologically
    ) as MyLag,

    -- Get the next month's NumberAttendance (1 row after the current row in the partition)
    lead(NumberAttendance, 1)
    over(
        partition by E.EmployeeNumber           -- Again, partition by employee
        order by A.AttendanceMonth              -- Ordered by month
    ) as MyLead,

    -- Calculate the difference between the current and previous month's attendance
    NumberAttendance - lag(NumberAttendance, 1)
    over(
        partition by E.EmployeeNumber           -- Partition by employee
        order by A.AttendanceMonth              -- Order by month
    ) as MyDiff

-- (Optional - commented out below)

--   -- Get the first attendance value within a 2-row frame ending at the current row
--   first_value(NumberAttendance)
--   over(
--       partition by E.EmployeeNumber
--       order by A.AttendanceMonth
--       rows between 1 preceding and current row
--   ) as MyFirstValue,

--   -- Get the last attendance value within a 2-row frame starting at the current row
--   last_value(NumberAttendance)
--   over(
--       partition by E.EmployeeNumber
--       order by A.AttendanceMonth
--       rows between current row and 1 following
--   ) as MyLastValue



from 
    tblEmployee as E 
join 
    tblAttendance as A
on 
    E.EmployeeNumber = A.EmployeeNumber       -- Join attendance records to employee data

