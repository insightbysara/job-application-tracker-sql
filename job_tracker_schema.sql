
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Password VARCHAR(100)
);

CREATE TABLE Companies (
    CompanyID INT PRIMARY KEY,
    CompanyName VARCHAR(100),
    Industry VARCHAR(100)
);

CREATE TABLE Jobs (
    JobID INT PRIMARY KEY,
    CompanyID INT,
    JobTitle VARCHAR(100),
    Location VARCHAR(100),
    SalaryRange VARCHAR(50),
    FOREIGN KEY (CompanyID) REFERENCES Companies(CompanyID)
);

CREATE TABLE JobApplications (
    ApplicationID INT PRIMARY KEY,
    UserID INT,
    JobID INT,
    Status VARCHAR(50),
    DateApplied DATE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (JobID) REFERENCES Jobs(JobID)
);

CREATE TABLE Interviews (
    InterviewID INT PRIMARY KEY,
    ApplicationID INT,
    InterviewDate DATE,
    InterviewType VARCHAR(50),
    Outcome VARCHAR(100),
    RejectionReason TEXT,
    FOREIGN KEY (ApplicationID) REFERENCES JobApplications(ApplicationID)
);

CREATE TABLE JobOffers (
    OfferID INT PRIMARY KEY,
    ApplicationID INT,
    SalaryOffered DECIMAL(10,2),
    OfferDate DATE,
    OfferStatus VARCHAR(50),
    FOREIGN KEY (ApplicationID) REFERENCES JobApplications(ApplicationID)
);

CREATE TABLE Documents (
    DocumentID INT PRIMARY KEY,
    UserID INT,
    ApplicationID INT,
    FileType VARCHAR(50),
    FilePath TEXT,
    UploadDate DATE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ApplicationID) REFERENCES JobApplications(ApplicationID)
);

CREATE TABLE Reminders (
    ReminderID INT PRIMARY KEY,
    ApplicationID INT,
    ReminderType VARCHAR(50),
    ReminderDate DATE,
    FOREIGN KEY (ApplicationID) REFERENCES JobApplications(ApplicationID)
);
