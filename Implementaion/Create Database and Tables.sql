-- Create Database
CREATE DATABASE Company;

-- Use the database
USE Company;

-- Create Tables
CREATE TABLE Department (
    DeptNo CHAR(2) PRIMARY KEY,
    DeptName VARCHAR(50),
    Location VARCHAR(50)
);

CREATE TABLE Employee (
    SSN CHAR(9) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary INT CHECK (Salary < 6000),
    Address VARCHAR(50) CHECK (Address IN ('alex', 'mansoura', 'cairo')),
    SupervisorSSN CHAR(9),
    DeptNo CHAR(2),
    FOREIGN KEY (SupervisorSSN) REFERENCES Employee(SSN),
    FOREIGN KEY (DeptNo) REFERENCES Department(DeptNo)
);

CREATE TABLE Dependent (
    DependentName VARCHAR(50),
    Sex CHAR(1),
    BirthDate DATE,
    Relationship VARCHAR(50),
    EmployeeSSN CHAR(9),
    FOREIGN KEY (EmployeeSSN) REFERENCES Employee(SSN)
);

CREATE TABLE Project (
    ProjectNo CHAR(3) PRIMARY KEY,
    ProjectName VARCHAR(50),
    DeptNo CHAR(2),
    FOREIGN KEY (DeptNo) REFERENCES Department(DeptNo)
);

CREATE TABLE WorksOn (
    EmployeeSSN CHAR(9),
    ProjectNo CHAR(3),
    PRIMARY KEY (EmployeeSSN, ProjectNo),
    FOREIGN KEY (EmployeeSSN) REFERENCES Employee(SSN),
    FOREIGN KEY (ProjectNo) REFERENCES Project(ProjectNo)
);
