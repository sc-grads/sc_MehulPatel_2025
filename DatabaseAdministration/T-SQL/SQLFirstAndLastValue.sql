-- Select the employee number, month of attendance, and number of attendances
select A.EmployeeNumber, 
       A.AttendanceMonth, 
       A.NumberAttendance, 

       -- Get the first value of NumberAttendance for each employee based on the order of AttendanceMonth
       first_value(NumberAttendance)
       over(
         partition by E.EmployeeNumber       -- Partition the data by each employee
         order by A.AttendanceMonth          -- Within each employee group, order by attendance month
       ) as FirstMonth,

       -- Get the last value of NumberAttendance for each employee based on the order of AttendanceMonth
       last_value(NumberAttendance)
       over(
         partition by E.EmployeeNumber       -- Again, partition the data by each employee
         order by A.AttendanceMonth          -- Order the attendance records by month
         rows between unbounded preceding and unbounded following 
         -- This frame includes all rows in the partition, so LAST_VALUE gives the true last value
       ) as LastMonth

-- From the tblEmployee table (aliased as E) joined with tblAttendance (aliased as A)
from tblEmployee as E 
join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber  -- Join condition: match employee numbers from both tables
