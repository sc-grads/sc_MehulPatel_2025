-- Query 1: Calculate cumulative distribution and percent rank of attendance counts per employee
select 
    A.EmployeeNumber,                -- Employee ID
    A.AttendanceMonth,              -- Month of attendance
    A.NumberAttendance,             -- Attendance count in that month

    -- Cumulative distribution of NumberAttendance within each employee's data
    CUME_DIST()    
    over(
        partition by E.EmployeeNumber       -- Partition by employee to handle each separately
        order by A.NumberAttendance          -- Order by attendance count (ascending)
    ) as MyCume_Dist,

    -- Percent rank of NumberAttendance within each employee's data, multiplied by 100 for percentage
    PERCENT_RANK() 
    over(
        partition by E.EmployeeNumber       -- Partition by employee
        order by A.NumberAttendance          -- Order by attendance count
    ) * 100 as MyPercent_Rank              -- Convert decimal to percentage
from 
    tblEmployee as E 
join 
    tblAttendance as A
on 
    E.EmployeeNumber = A.EmployeeNumber     -- Join employees with their attendance records


-- Query 2: Calculate 40th percentile values of NumberAttendance per employee using two methods
SELECT DISTINCT 
    EmployeeNumber,

    -- Continuous percentile (interpolates if exact percentile doesn't exist)
    PERCENTILE_CONT(0.4) 
    WITHIN GROUP (ORDER BY NumberAttendance) 
    OVER (PARTITION BY EmployeeNumber) as AverageCont,

    -- Discrete percentile (selects actual value at percentile position)
    PERCENTILE_DISC(0.4) 
    WITHIN GROUP (ORDER BY NumberAttendance) 
    OVER (PARTITION BY EmployeeNumber) as AverageDisc

from 
    tblAttendance
