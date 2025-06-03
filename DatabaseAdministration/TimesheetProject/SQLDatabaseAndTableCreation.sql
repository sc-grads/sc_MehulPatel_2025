CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY IDENTITY,
    FullName NVARCHAR(100) NOT NULL,
    );

CREATE TABLE Client (
    ClientID INT PRIMARY KEY IDENTITY,
    ClientName NVARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Project (
    ProjectID INT PRIMARY KEY IDENTITY,
    ProjectName NVARCHAR(100) NOT NULL,
    ClientID INT NOT NULL,
    FOREIGN KEY (ClientID) REFERENCES Client(ClientID)
);

CREATE TABLE TimesheetEntry (
    TimesheetID INT PRIMARY KEY IDENTITY,
    EmployeeID INT NOT NULL,
    ProjectID INT NOT NULL,
    WorkDate DATE NOT NULL,
    DayOfWeek VARCHAR(10),
    Description NVARCHAR(255),
    Billable BIT,
    Comments NVARCHAR(255),
    TotalHours DECIMAL(4,2),
    StartTime TIME,
    EndTime TIME,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID)
);
