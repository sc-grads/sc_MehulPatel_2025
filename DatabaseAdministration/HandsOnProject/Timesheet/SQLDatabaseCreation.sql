-- Create TeamMembers table
CREATE TABLE EmployeeName(
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL
);

-- Create Clients table
CREATE TABLE Client (
    ClientID INT IDENTITY(1,1) PRIMARY KEY,
    ClientName NVARCHAR(50) NULL
);


-- Create Timesheet table (Weekdays only)
CREATE TABLE Timesheet (
    TimesheetID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeID INT NULL,
    Date DATE NULL,
    DofWeek NVARCHAR(100),
    ClientID INT NULL,
	ClientProjectName NVARCHAR(100),
    Description NVARCHAR(255) NULL,
    IsBillable NVARCHAR(255),
    Comments NVARCHAR(max) NULL,
    StartTime TIME NULL,
    EndTime TIME NULL,
    HoursWorked DECIMAL(5,2) NULL,
    FOREIGN KEY (EmployeeID) REFERENCES EmployeeName(EmployeeID),
    CHECK (
        DATEPART(WEEKDAY, Date) BETWEEN 2 AND 6
    ) -- 2 = Monday, 6 = Friday (default SQL Server config)
);

--Create Leave table
CREATE TABLE [dbo].[Leave](
	[LeaveID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [nvarchar](100) NULL,
	[TypeOfLeave] [nvarchar](100) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[NumberOfDays] [int] NULL,
	[ApprovalObtained] [nvarchar](100) NULL,
	[SickNote] [nvarchar](255) NULL
);	
--Audit table
CREATE TABLE AuditLog (
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
	EmployeeID INT,
    TableName NVARCHAR(50) NOT NULL,         -- e.g., 'Timesheet'
    TaskName NVARCHAR(50) NOT NULL,        -- 'INSERT', 'UPDATE', 'DELETE'
	NameOfFile NVARCHAR(100) ,
	Month NVARCHAR(50),
	Details NVARCHAR(4000),
    ActionTimestamp DATETIME NULL DEFAULT GETDATE(),
    
   );

