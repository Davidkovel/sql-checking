CREATE DATABASE Hospital

USE Hospital


CREATE TABLE Departments (
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Building INT NOT NULL CHECK (Building BETWEEN 1 AND 5),
    Financing MONEY NOT NULL DEFAULT 0 CHECK (Financing >= 0),
    Floor INT NOT NULL CHECK (Floor >= 1),
    Name NVARCHAR(100) NOT NULL UNIQUE CHECK (Name <> '')
);

CREATE TABLE Diseases (
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Name NVARCHAR(100) NOT NULL UNIQUE CHECK (Name <> ''),
    Severity INT NOT NULL DEFAULT 1 CHECK (Severity >= 1)
);

CREATE TABLE Doctors (
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Name NVARCHAR(MAX) NOT NULL CHECK (Name <> ''),
    Phone CHAR(10) NOT NULL,
    Premium MONEY NOT NULL DEFAULT 0 CHECK (Premium >= 0),
    Salary MONEY NOT NULL CHECK (Salary > 0),
    Surname NVARCHAR(MAX) NOT NULL CHECK (Surname <> '')
);

CREATE TABLE Examinations (
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    DayOfWeek INT NOT NULL CHECK (DayOfWeek BETWEEN 1 AND 7),
    EndTime TIME NOT NULL,
    Name NVARCHAR(100) NOT NULL UNIQUE CHECK (Name <> ''),
    StartTime TIME NOT NULL CHECK (StartTime >= '08:00' AND StartTime <= '18:00'),
    CHECK (EndTime > StartTime)
);

CREATE TABLE Wards (
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Building INT NOT NULL CHECK (Building BETWEEN 1 AND 5),
    Floor INT NOT NULL CHECK (Floor >= 1),
    Name NVARCHAR(20) NOT NULL UNIQUE CHECK (Name <> '')
);

-- INSERTING COMMANDS

INSERT INTO Departments (Building, Financing, Floor, Name) VALUES 
(1, 20000, 2, 'Cardiology'),
(2, 25000, 3, 'Neurology'),
(3, 12000, 1, 'Pediatrics');

INSERT INTO Diseases (Name, Severity) VALUES 
('Hypertension', 2),
('Diabetes', 3),
('Asthma', 2);

INSERT INTO Doctors (Name, Phone, Premium, Salary, Surname) VALUES 
('John', '1234567890', 500, 2000, 'Smith'),
('Emily', '0987654321', 300, 1800, 'Johnson'),
('David', '9988776655', 600, 2500, 'Jones');

INSERT INTO Examinations (DayOfWeek, EndTime, Name, StartTime) VALUES 
(1, '14:00', 'Blood Test', '12:00'),
(2, '15:00', 'X-Ray', '13:00'),
(3, '16:00', 'MRI', '14:00');

INSERT INTO Wards (Building, Floor, Name) VALUES 
(1, 2, 'Ward A'),
(2, 3, 'Ward B'),
(3, 1, 'Ward C');


-- SELECTING COMMANDS

SELECT * FROM Wards;

SELECT Surname, Phone FROM Doctors;

SELECT DISTINCT Floor FROM Wards;

-- stop here
SELECT Name AS Name_of_Disease, Severity AS Severity_of_Disease FROM Diseases;

SELECT d.Name AS DepartmentName, w.Name AS WardName, doc.Surname AS DoctorSurname
FROM Departments d, Wards w, Doctors doc;

SELECT Name FROM Departments 
WHERE Building = 5 AND Financing < 30000;

SELECT Name FROM Departments 
WHERE Building = 3 AND Financing BETWEEN 12000 AND 15000;

SELECT Name FROM Wards 
WHERE Building IN (4, 5) AND Floor = 1;

SELECT Name, Building, Financing FROM Departments 
WHERE (Building IN (3, 6)) AND (Financing < 11000 OR Financing > 25000);

SELECT Surname FROM Doctors 
WHERE (Salary + Premium) > 1500;

SELECT Surname FROM Doctors 
WHERE (Salary / 2) > (3 * Premium);

SELECT DISTINCT Name FROM Examinations 
WHERE DayOfWeek IN (1, 2, 3) 
  AND StartTime >= '12:00' 
  AND EndTime <= '15:00';

SELECT Name, Building FROM Departments 
WHERE Building IN (1, 3, 8, 10);

SELECT Name FROM Diseases 
WHERE Severity NOT IN (1, 2);

SELECT Name FROM Departments 
WHERE Building NOT IN (1, 3);

SELECT Name 
FROM Departments 
WHERE Building IN (1, 3);

SELECT Surname FROM Doctors 
WHERE Surname LIKE 'N%';


-- deleting db

DROP TABLE Departments;
DROP TABLE Doctors;
DROP TABLE Diseases;
DROP TABLE Examinations;
DROP TABLE Wards;

USE master

DROP DATABASE Hospital