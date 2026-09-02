CREATE DATABASE MarathonManagementSystem;

USE MarathonManagementSystem;

--Creating Tables
--Role
CREATE TABLE Roles (
    RoleID INT AUTO_INCREMENT PRIMARY KEY,
    RoleName VARCHAR(50) NOT NULL UNIQUE
);
INSERT INTO Roles (RoleName)
VALUES
    ('Administrator'),
    ('Organizer'),
    ('Participant');
--User 
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    RoleID INT NOT NULL,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Email VARCHAR(150) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(20),
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (RoleID)
        REFERENCES Roles(RoleID)
);
--Participant
CREATE TABLE Participants (
    ParticipantID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL UNIQUE,
    DateOfBirth DATE,
    Gender VARCHAR(20),
    EmergencyContact VARCHAR(20),
    Address VARCHAR(255),
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (UserID)
        REFERENCES Users(UserID)
        ON DELETE CASCADE
);
--categories
CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL,
    Distance VARCHAR(50) NOT NULL,
    Description VARCHAR(255)
);
--Insrting Testing Data
INSERT INTO Categories (CategoryName, Distance, Description)
VALUES
    ('Running', '5 km', 'Short distance running event'),
    ('Running', '10 km', 'Medium distance running event'),
    ('Running', '21 km', 'Half marathon running event'),
    ('Running', '42 km', 'Full marathon running event'),
    ('Cycling', '20 km', 'Short distance cycling event'),
    ('Cycling', '50 km', 'Medium distance cycling event'),
    ('Walking', '5 km', 'Short distance walking event'),
    ('Walking', '10 km', 'Long distance walking event');
-- Event
CREATE TABLE Events (
    EventID INT AUTO_INCREMENT PRIMARY KEY,
    EventName VARCHAR(150) NOT NULL,
    EventDate DATE NOT NULL,
    StartTime TIME NOT NULL,
    EndTime TIME,
    Location VARCHAR(255) NOT NULL,
    Description TEXT,
    OrganizerID INT,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (OrganizerID)
        REFERENCES Users(UserID)
        ON DELETE SET NULL
);
--Registration Table
CREATE TABLE Registrations (
    RegistrationID INT AUTO_INCREMENT PRIMARY KEY,
    ParticipantID INT NOT NULL,
    EventID INT NOT NULL,
    CategoryID INT NOT NULL,
    RegistrationDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    Status VARCHAR(50) DEFAULT 'Pending',
    BibNumber VARCHAR(50) UNIQUE,

    FOREIGN KEY (ParticipantID)
        REFERENCES Participants(ParticipantID)
        ON DELETE CASCADE,

    FOREIGN KEY (EventID)
        REFERENCES Events(EventID)
        ON DELETE CASCADE,

    FOREIGN KEY (CategoryID)
        REFERENCES Categories(CategoryID)
        ON DELETE RESTRICT
);
--Checkingpoint
CREATE TABLE Checkpoints (
    CheckpointID INT AUTO_INCREMENT PRIMARY KEY,
    EventID INT NOT NULL,
    CheckpointName VARCHAR(150) NOT NULL,
    Location VARCHAR(255),
    CheckpointOrder INT NOT NULL,
    DistanceFromStart DECIMAL(10,2),

    FOREIGN KEY (EventID)
        REFERENCES Events(EventID)
        ON DELETE CASCADE
); 