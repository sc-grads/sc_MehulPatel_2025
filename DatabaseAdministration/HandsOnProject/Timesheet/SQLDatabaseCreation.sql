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
    EmployeeID INT NOT NULL,
    Date DATE NOT NULL,
    ClientID INT NOT NULL,
	ClientProjectName NVARCHAR(100),
    Description NVARCHAR(255) NULL,
    IsBillable BIT NULL,
    Comments NVARCHAR(max) NULL,
    StartTime TIME NULL,
    EndTime TIME NULL,
    HoursWorked DECIMAL(5,2) NULL,
    FOREIGN KEY (EmployeeID) REFERENCES EmployeeName(EmployeeID),
    CHECK (
        DATEPART(WEEKDAY, Date) BETWEEN 2 AND 6
    ) -- 2 = Monday, 6 = Friday (default SQL Server config)
);

