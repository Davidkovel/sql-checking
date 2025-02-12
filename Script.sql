CREATE DATABASE Academy

USE Academy

CREATE TABLE Departments (
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Financing MONEY NOT NULL DEFAULT 0 CHECK (Financing >= 0),
    Name NVARCHAR(100) NOT NULL UNIQUE CHECK (Name <> '')
);

CREATE TABLE Faculties (
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Dean NVARCHAR(MAX) NOT NULL CHECK (Dean <> ''),
    Name NVARCHAR(100) NOT NULL UNIQUE CHECK (Name <> '')
);

CREATE TABLE Groups (
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Name NVARCHAR(10) NOT NULL UNIQUE CHECK (Name <> ''),
    Rating INT NOT NULL CHECK (Rating BETWEEN 0 AND 5),
    Year INT NOT NULL CHECK (Year BETWEEN 1 AND 5)
);

CREATE TABLE Teachers (
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    EmploymentDate DATE NOT NULL CHECK (EmploymentDate >= '1990-01-01'),
    IsAssistant BIT NOT NULL DEFAULT 0,
    IsProfessor BIT NOT NULL DEFAULT 0,
    Name NVARCHAR(MAX) NOT NULL CHECK (Name <> ''),
    Position NVARCHAR(MAX) NOT NULL CHECK (Position <> ''),
    Premium MONEY NOT NULL DEFAULT 0 CHECK (Premium >= 0),
    Salary MONEY NOT NULL CHECK (Salary > 0),
    Surname NVARCHAR(MAX) NOT NULL CHECK (Surname <> '')
);

-- INSERTING COMMANDS

INSERT INTO Departments (Financing, Name) VALUES 
(15000, 'Computer Science'),
(29000, 'Mathematics'),
(18000, 'Physics'),
(22000, 'Chemistry'),
(10000, 'Biology');

INSERT INTO Faculties (Dean, Name) VALUES 
('John Doe', 'Faculty of Engineering'),
('Jane Smith', 'Faculty of Science'),
('Michael Brown', 'Faculty of Arts'),
('Emily Johnson', 'Faculty of Medicine'),
('David Wilson', 'Faculty of Law');

INSERT INTO Groups (Name, Rating, Year) VALUES 
('CS101', 4, 1),
('MATH202', 5, 2),
('PHY303', 3, 3),
('CHEM404', 4, 4),
('BIO505', 2, 5);

INSERT INTO Teachers (EmploymentDate, IsAssistant, IsProfessor, Name, Position, Premium, Salary, Surname) VALUES 
('2005-09-01', 0, 1, 'John', 'Professor', 500, 3000, 'Doe'),
('2010-03-15', 1, 0, 'Jane', 'Assistant', 100, 1500, 'Smith'),
('2015-11-20', 0, 1, 'Michael', 'Professor', 1600, 3200, 'Brown'),
('2018-07-10', 1, 0, 'Emily', 'Assistant', 300, 1800, 'Johnson'),
('2020-02-25', 0, 0, 'David', 'Lecturer', 400, 2500, 'Wilson');

-- SELECTING COMMANDS

SELECT Name, Financing, Id FROM Departments;

SELECT Name AS [Group Name], Rating AS [Group Rating] FROM Groups;

SELECT Surname,
    (Salary / Premium) * 100 AS Salary_with_Premium,
    (Salary / (Salary + Premium)) * 100 AS Total_Salary
FROM Teachers;

SELECT 'The dean of faculty ' + Name + ' is ' + Dean + '.' AS FacultyInfo 
FROM Faculties;

SELECT Surname FROM Teachers
WHERE IsProfessor = 1 AND Salary > 1050;

SELECT Name FROM Departments
WHERE Financing < 11000 OR Financing > 25000; 

SELECT Name FROM Departments
WHERE Name <> 'Computer Science';

SELECT Surname, Position FROM Teachers
WHERE IsProfessor != 1;

SELECT Surname, Position, Salary, Premium FROM Teachers
WHERE IsAssistant = 1 AND Premium BETWEEN 160 AND 550;

SELECT Surname, Salary FROM Teachers
WHERE IsAssistant = 1;

SELECT Surname, Position FROM Teachers
WHERE EmploymentDate < '2000-01-01';

SELECT Name AS [Name Of Department] FROM Departments
WHERE Name < 'Software Development'
ORDER BY Name;

SELECT Surname FROM Teachers
WHERE IsAssistant  = 1 AND (Salary + Premium) <= 1200; 

SELECT Name FROM Groups
WHERE Year = 5 AND Rating BETWEEN 2 AND 4 ;

SELECT Surname FROM Teachers
WHERE IsAssistant = 1 AND (Salary < 550 OR Premium < 200);

-- deleting db

DROP TABLE Departments;
DROP TABLE Faculties;
DROP TABLE Groups;
DROP TABLE Teachers;

USE MASTER;

DROP DATABASE Academy;
