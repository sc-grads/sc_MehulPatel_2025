-- Select attendance data and statistical ranking metrics
select 
    A.EmployeeNumber,                -- Employee's unique identifier
    A.AttendanceMonth,              -- Month of the attendance record
    A.NumberAttendance,             -- Number of attendances for that month

    -- Calculate cumulative distribution:
    -- the relative rank of the current row within its partition.
    CUME_DIST()    
    over(
        partition by E.EmployeeNumber       -- Evaluate within each employee group
        order by A.AttendanceMonth          -- Ordered by attendance month
    ) as MyCume_Dist,

    -- Calculate percent rank:
    -- the relative percentile of a row, ranging from 0 to 1.
    PERCENT_RANK() 
    over(
        partition by E.EmployeeNumber       -- Evaluate within each employee
        order by A.AttendanceMonth          -- Based on attendance month
    ) as MyPercent_Rank,

    -- Manual calculation of CUME_DIST:
    -- current row number divided by total rows in the partition
    cast(row_number() 
        over(partition by E.EmployeeNumber order by A.AttendanceMonth) 
        as decimal(9,5))
    / count(*) over(partition by E.EmployeeNumber) 
    as CalcCume_Dist,

    -- Manual calculation of PERCENT_RANK:
    -- (row number - 1) divided by (total rows - 1)
    cast(row_number() 
        over(partition by E.EmployeeNumber order by A.AttendanceMonth) - 1 
        as decimal(9,5))
    / (count(*) over(partition by E.EmployeeNumber) - 1) 
    as CalcPercent_Rank

-- Data source: join employee and attendance tables
from 
    tblEmployee as E 
join 
    tblAttendance as A
on 
    E.EmployeeNumber = A.EmployeeNumber       -- Match employee records to their attendance
