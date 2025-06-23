-- Select statement to retrieve attendance details and compute totals and percentages
SELECT 
    A.EmployeeNumber,                    -- The unique ID of the employee
    A.AttendanceMonth,                  -- The month for which attendance is recorded
    A.NumberAttendance,                 -- The number of days the employee was present in that month

    -- Sum the number of attendance days per employee across all months
    -- This helps us calculate the total attendance for each employee
    SUM(A.NumberAttendance) OVER( PARTITION BY E.EmployeeNumber)   -- Group the sum calculation by each individual employee
    AS SumAttendance,

    -- Calculate the percentage of monthly attendance relative to the employee's total attendance
    -- Convert to money to maintain decimal precision and multiply by 100 for percentage
    CONVERT(money, A.NumberAttendance) / 
    SUM(A.NumberAttendance) OVER(
        PARTITION BY E.EmployeeNumber   -- Again, total attendance per employee for percentage calculation
    ) * 100 AS PercentageAttendance

-- Define the data source: joining employee and attendance tables
FROM tblEmployee AS E 
JOIN tblAttendance AS A 
    ON E.EmployeeNumber = A.EmployeeNumber  -- Join condition: link attendance data to the correct employee



	-- Select statement to retrieve attendance records and compute cumulative monthly totals and percentages
SELECT 
    A.EmployeeNumber,                    -- The unique ID of the employee
    A.AttendanceMonth,                  -- The month for which attendance is recorded
    A.NumberAttendance,                 -- The number of days the employee was present in that month

    -- Compute a running total (cumulative sum) of attendance
    -- This is done per employee and per year, ordered by month
    SUM(A.NumberAttendance) OVER(
        PARTITION BY E.EmployeeNumber,      -- Group by employee
                     YEAR(A.AttendanceMonth) -- Further group by year
        ORDER BY A.AttendanceMonth          -- Calculate running total in chronological order
    ) AS SumAttendance,

    -- Compute percentage of monthly attendance relative to the total attendance per employee
    -- Note: This does not reset per year, just per employee
    CONVERT(money, A.NumberAttendance) / 
    SUM(A.NumberAttendance) OVER(
        PARTITION BY E.EmployeeNumber       -- Total attendance for percentage is still per employee
    ) * 100 AS PercentageAttendance

-- Define the data source: join employee and attendance records
FROM tblEmployee AS E 
JOIN tblAttendance AS A 
    ON E.EmployeeNumber = A.EmployeeNumber  -- Ensure correct data is matched by employee number

-- Order the final result set by employee and month for readability
ORDER BY A.EmployeeNumber, A.AttendanceMonth
