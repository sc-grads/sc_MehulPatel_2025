SELECT 
    A.EmployeeNumber,               -- Employee number
    A.AttendanceMonth,             -- Attendance month
    A.NumberAttendance,            -- Number of attendance days

    NTILE(10) OVER (
        PARTITION BY E.EmployeeNumber 
        ORDER BY A.AttendanceMonth
    ) AS TheNTile,
    -- System-generated decile assignment

    CONVERT(INT, 
        (
            ROW_NUMBER() OVER (
                PARTITION BY E.EmployeeNumber 
                ORDER BY A.AttendanceMonth
            ) - 1
        ) / 
        (
            COUNT(*) OVER (
                PARTITION BY E.EmployeeNumber
                -- COUNT does not need ORDER BY when used with ROWS clause
                ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
            ) / 10.0
        ) + 1
    ) AS MyNTile
    -- Manually calculate NTILE using ROW_NUMBER and COUNT

FROM tblEmployee AS E
JOIN tblAttendance AS A
    ON E.EmployeeNumber = A.EmployeeNumber
-- Join employees with their attendance

WHERE A.AttendanceMonth < '2015-05-01';
-- Filter for attendance before May 2015
