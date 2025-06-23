-- 1) Total attendance across ALL employees and months (no partition, no order)
SELECT 
    A.EmployeeNumber, 
    A.AttendanceMonth, 
    A.NumberAttendance,
    
    -- Total attendance across the entire dataset (all employees, all months)
    -- No PARTITION BY or ORDER BY means this sums over the entire table as one group.
    SUM(A.NumberAttendance) OVER () AS TotalAttendance
    
    -- Optional: Calculate percentage of total attendance per row
    -- Uncomment below to see what % this row's attendance is of the total
    -- , CONVERT(decimal(18,7), A.NumberAttendance) / SUM(A.NumberAttendance) OVER () * 100.0000 AS PercentageAttendance

FROM tblEmployee AS E 
JOIN tblAttendance AS A ON E.EmployeeNumber = A.EmployeeNumber;

------------------------------------------------------------

-- 2) Just the overall total attendance across the whole attendance table (no window function)
SELECT SUM(NumberAttendance) FROM tblAttendance;

------------------------------------------------------------

-- 3) Sum of attendance per employee and year, ordered by month
SELECT 
    A.EmployeeNumber, 
    A.AttendanceMonth, 
    A.NumberAttendance,
    
    -- Running sum of attendance for each employee and year, ordered by month
    -- Note: No ROWS or RANGE specified here — defaults apply!
    SUM(A.NumberAttendance) OVER (
        PARTITION BY E.EmployeeNumber, YEAR(A.AttendanceMonth) 
        ORDER BY A.AttendanceMonth
        -- Default frame: RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW (because ORDER BY exists)
    ) AS SumAttendance

FROM tblEmployee AS E 
JOIN (
    -- Duplicated attendance data to test window behavior with duplicates
    SELECT * FROM tblAttendance
    UNION ALL
    SELECT * FROM tblAttendance
) AS A ON E.EmployeeNumber = A.EmployeeNumber

ORDER BY A.EmployeeNumber, A.AttendanceMonth;
