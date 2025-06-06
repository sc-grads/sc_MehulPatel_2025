CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY IDENTITY,
    FullName NVARCHAR(100) NOT NULL,
    );


CREATE TABLE Timesheet (
    EntryID INT PRIMARY KEY IDENTITY(1,1),
    Date DATE  ,
    DayOfWeek NVARCHAR(30) ,
    Client NVARCHAR(50) ,
    ClientProjectName NVARCHAR(100) ,
    Description NVARCHAR(100) ,
    Billable NVARCHAR(50) ,
    Comments NVARCHAR(max), --noticed that some of my comments are too long.
    TotalHours DECIMAL(6,2) ,
    StartTime TIME(0) ,
    EndTime TIME(0),
	CONSTRAINT CheckTimeOrder CHECK (EndTime > StartTime),
    CONSTRAINT CheckTotalHours CHECK (TotalHours >= 0 AND TotalHours <= 24)
    
);
