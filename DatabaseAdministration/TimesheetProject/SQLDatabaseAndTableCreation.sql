CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY IDENTITY,
    FullName NVARCHAR(100) NOT NULL,
    );

CREATE TABLE Client (
    ClientID INT PRIMARY KEY IDENTITY,
    ClientName NVARCHAR(100) NULL 
);

CREATE TABLE Project (
    ProjectID INT PRIMARY KEY IDENTITY,
    ProjectName NVARCHAR(100) NULL,
    ClientID INT NOT NULL,
    FOREIGN KEY (ClientID) REFERENCES Client(ClientID)
);

CREATE TABLE Timesheet(
    TimesheetID INT PRIMARY KEY IDENTITY,
    EmployeeID INT NOT NULL,
    ProjectID INT NOT NULL,
    WorkDate DATE ,
    DayOfWeek NVARCHAR(50),
    Description NVARCHAR(100),
    Billable NVARCHAR(50),
    Comments NVARCHAR(4000),
    TotalHours DECIMAL(5,2),
    StartTime TIME(0),
    EndTime TIME(0),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID),
	CONSTRAINT CheckTimeOrder CHECK (EndTime > StartTime),
    CONSTRAINT CheckTotalHours CHECK (TotalHours >= 0 AND TotalHours <= 24),
    
);
