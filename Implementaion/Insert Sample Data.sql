-- Insert data into Department
INSERT INTO Department (DeptNo, DeptName, Location) VALUES
('D1', 'HR', 'alex'),
('D2', 'IT', 'mansoura');

-- Insert data into Employee
INSERT INTO Employee (SSN, FirstName, LastName, Salary, Address, SupervisorSSN, DeptNo) VALUES
('123456789', 'John', 'Doe', 5000, 'alex', NULL, 'D1'),
('987654321', 'Jane', 'Smith', 4000, 'mansoura', '123456789', 'D2');

-- Insert data into Dependent
INSERT INTO Dependent (DependentName, Sex, BirthDate, Relationship, EmployeeSSN) VALUES
('Mary', 'F', '2000-01-01', 'Daughter', '123456789'),
('Paul', 'M', '1995-05-05', 'Son', '987654321');

-- Insert data into Project
INSERT INTO Project (ProjectNo, ProjectName, DeptNo) VALUES
('P1', 'ProjectA', 'D1'),
('P2', 'ProjectB', 'D2');

-- Insert data into WorksOn
INSERT INTO WorksOn (EmployeeSSN, ProjectNo) VALUES
('123456789', 'P1'),
('987654321', 'P2');
