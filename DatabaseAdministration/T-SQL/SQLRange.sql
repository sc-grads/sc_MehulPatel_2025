-- Select the employee number from the attendance table
SELECT 
    A.EmployeeNumber,                       

    -- Select the month corresponding to the attendance record
    A.AttendanceMonth,                      

    -- Select the number of days the employee attended in that month
    A.NumberAttendance,                     

    -- Calculate a rolling total (sum) of attendance numbers for each employee
    -- The rolling window includes 1 row before and 1 row after the current row
    SUM(A.NumberAttendance) OVER (          
        PARTITION BY E.EmployeeNumber       -- Group the data by employee so the window function applies per employee
        ORDER BY A.AttendanceMonth          -- Order the rows by attendance month to determine the window range
        ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING -- Include the previous, current, and next month's records in the sum
    ) AS RollingTotal                        -- Alias the result as 'RollingTotal'
    
-- Specify the tables to pull data from
FROM 
    tblEmployee AS E                        -- The employee table, aliased as E
JOIN 
    tblAttendance AS A                      -- The attendance table, aliased as A
    ON E.EmployeeNumber = A.EmployeeNumber  -- Join the tables on matching EmployeeNumber
