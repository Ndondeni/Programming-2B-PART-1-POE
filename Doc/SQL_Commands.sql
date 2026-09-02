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
