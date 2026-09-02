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
