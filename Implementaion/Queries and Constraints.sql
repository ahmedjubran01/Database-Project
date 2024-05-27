-- 1. Display the full data about all the dependence associated with the name of the employee they depend on him/her
SELECT d.*, e.FirstName, e.LastName
FROM Dependent d
JOIN Employee e ON d.EmployeeSSN = e.SSN;

-- 2. Retrieve the names of all employees and the names of the projects they are working on, sorted by the project name
SELECT e.FirstName, e.LastName, p.ProjectName
FROM Employee e
JOIN WorksOn w ON e.SSN = w.EmployeeSSN
JOIN Project p ON w.ProjectNo = p.ProjectNo
ORDER BY p.ProjectName;

-- 3. Select max two salaries in employee table
SELECT DISTINCT Salary
FROM Employee
ORDER BY Salary DESC
LIMIT 2;

-- 4. Select employee name and his salary but if there is no salary display '3000'
SELECT FirstName, LastName, COALESCE(Salary, 3000) as Salary
FROM Employee;

-- 5. Select employee first name and the data of his supervisor
SELECT e.FirstName, s.FirstName as SupervisorFirstName, s.LastName as SupervisorLastName
FROM Employee e
LEFT JOIN Employee s ON e.SupervisorSSN = s.SSN;

-- 6. Display the data of the second highest-salary employee without duplicate
SELECT * FROM Employee e1
WHERE 1 = (SELECT COUNT(DISTINCT Salary) 
           FROM Employee e2 
           WHERE e2.Salary > e1.Salary);

-- 7. Display any Project with a Name starting with the letter B
SELECT * FROM Project
WHERE ProjectName LIKE 'B%';

-- 8. Create a rule on Salary column in employee to ensure that it is less than 6000
-- Already implemented as a CHECK constraint in the table creation

-- 9. Add Constraint address column can only contain values that are either 'alex', 'mansoura', or 'cairo'
-- Already implemented as a CHECK constraint in the table creation
