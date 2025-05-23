-- 1) Rolling sum over current row and previous 2 rows (3-month rolling window backward)
SELECT 
    A.EmployeeNumber, 
    A.AttendanceMonth, 
    A.NumberAttendance, 
    
    SUM(A.NumberAttendance) OVER (
        PARTITION BY E.EmployeeNumber 
        ORDER BY A.AttendanceMonth 
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS RollingTotal

FROM tblEmployee AS E 
JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber;

------------------------------------------------------------

-- 2) Cumulative sum from the first record (unbounded preceding) to the current row
SELECT 
    A.EmployeeNumber, 
    A.AttendanceMonth, 
    A.NumberAttendance, 
    
    SUM(A.NumberAttendance) OVER (
        PARTITION BY E.EmployeeNumber 
        ORDER BY A.AttendanceMonth 
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS RollingTotal

FROM tblEmployee AS E 
JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber;

------------------------------------------------------------

-- 3) Rolling sum from current row to the last record (unbounded following)
SELECT 
    A.EmployeeNumber, 
    A.AttendanceMonth, 
    A.NumberAttendance, 
    
    SUM(A.NumberAttendance) OVER (
        PARTITION BY E.EmployeeNumber 
        ORDER BY A.AttendanceMonth 
        ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
    ) AS RollingTotal

FROM tblEmployee AS E 
JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber;
