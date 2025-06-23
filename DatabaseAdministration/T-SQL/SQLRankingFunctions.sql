-- ================================================
-- Query 1: GLOBAL ROW_NUMBER, RANK, DENSE_RANK
-- ================================================

SELECT 
    A.EmployeeNumber,              -- Employee number from attendance data
    A.AttendanceMonth,            -- Month of attendance
    A.NumberAttendance,           -- Number of days attended

    ROW_NUMBER() OVER(ORDER BY E.EmployeeNumber, A.AttendanceMonth) AS TheRowNumber,
    -- Unique row number across entire dataset

    RANK() OVER(ORDER BY E.EmployeeNumber, A.AttendanceMonth) AS TheRank,
    -- Ranking with gaps on ties

    DENSE_RANK() OVER(ORDER BY E.EmployeeNumber, A.AttendanceMonth) AS TheDenseRank
    -- Ranking without gaps on ties

FROM tblEmployee AS E
JOIN (
    SELECT * FROM tblAttendance
    UNION ALL
    SELECT * FROM tblAttendance
    -- Duplicate rows to simulate repeated entries
) AS A
ON E.EmployeeNumber = A.EmployeeNumber;

-- ================================================
-- Query 2: PARTITIONED ROW_NUMBER, RANK, DENSE_RANK
-- ================================================

SELECT 
    A.EmployeeNumber,              -- Employee number
    A.AttendanceMonth,            -- Month of attendance
    A.NumberAttendance,           -- Number of days attended

    ROW_NUMBER() OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth) AS TheRowNumber,
    -- Row number restarts per employee

    RANK() OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth) AS TheRank,
    -- Rank restarts per employee; has gaps on ties

    DENSE_RANK() OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth) AS TheDenseRank
    -- Dense rank restarts per employee; no gaps on ties

FROM tblEmployee AS E
JOIN (
    SELECT * FROM tblAttendance
    UNION ALL
    SELECT * FROM tblAttendance
    -- Duplicate rows to show impact of ties
) AS A
ON E.EmployeeNumber = A.EmployeeNumber;

-- ================================================
-- Query 3: Arbitrary ROW_NUMBER Without ORDERING
-- ================================================

SELECT *, 
    ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) AS RowNum
    -- Arbitrary row number; no specific order guaranteed

FROM tblAttendance;
