-- 12. Create a view that will display the project name and the number of employees work on it
CREATE VIEW ProjectEmployeeCount AS
SELECT p.ProjectName, COUNT(w.EmployeeSSN) as EmployeeCount
FROM Project p
LEFT JOIN WorksOn w ON p.ProjectNo = w.ProjectNo
GROUP BY p.ProjectName;

-- 13. Create a view that will display the emp#(ssn) and emp lastname who works on dept# is ‘d2’
CREATE VIEW EmployeesInD2 AS
SELECT e.SSN, e.LastName
FROM Employee e
WHERE e.DeptNo = 'D2';

-- 13 (contd). Display the employee lastname that contains letter “J”
SELECT LastName
FROM EmployeesInD2
WHERE LastName LIKE '%J%';
