SELECT 
    A.EmployeeNumber, 
    A.AttendanceMonth, 
    A.NumberAttendance,
    
    -- SUM using ROWS frame specification:
    -- This sums 'NumberAttendance' for the current row and every row physically following it,
    -- within the partition defined by EmployeeNumber and year of AttendanceMonth.
    -- Even if multiple rows share the same AttendanceMonth, each row is counted separately.
    SUM(A.NumberAttendance) OVER (
        PARTITION BY A.EmployeeNumber, YEAR(A.AttendanceMonth)  -- Partition data by employee and year
        ORDER BY A.AttendanceMonth                                -- Order rows by attendance month within partition
        ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING          -- Include current and all following rows physically
    ) AS RowsTotal,
    
    -- SUM using RANGE frame specification:
    -- This sums 'NumberAttendance' for all rows where AttendanceMonth is 
    -- greater than or equal to the current row's AttendanceMonth, within the same partition.
    -- Rows with the same AttendanceMonth value are considered peers and included together.
    -- The RANGE frame works on the *logical range* of the ordering column, not physical row count.
    SUM(A.NumberAttendance) OVER (
        PARTITION BY A.EmployeeNumber, YEAR(A.AttendanceMonth)  -- Same partition as above
        ORDER BY A.AttendanceMonth                                -- Same ordering as above
        RANGE BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING         -- Include all rows with AttendanceMonth >= current row's
    ) AS RangeTotal

FROM tblEmployee AS E 
JOIN (
    -- Duplicate attendance data with UNION ALL:
    -- This simulates multiple identical records for the same AttendanceMonth to show difference in behavior
    SELECT * FROM tblAttendance
    UNION ALL
    SELECT * FROM tblAttendance
) AS A ON E.EmployeeNumber = A.EmployeeNumber

-- Optional filtering to limit data before a certain date (commented out)
-- WHERE A.AttendanceMonth < '20150101'

-- Sort output by employee and month for easier reading
ORDER BY 
    A.EmployeeNumber, 
    A.AttendanceMonth;
