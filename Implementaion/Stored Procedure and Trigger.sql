-- 14. Create a stored procedure for updating project employees
CREATE PROCEDURE UpdateEmployeeOnProject @OldEmpNo CHAR(9), @NewEmpNo CHAR(9), @ProjectNo CHAR(3)
AS
BEGIN
    UPDATE WorksOn
    SET EmployeeSSN = @NewEmpNo
    WHERE EmployeeSSN = @OldEmpNo AND ProjectNo = @ProjectNo;
    PRINT 'Employee updated successfully';
END;

-- 15. Create table EmployeeAudit
CREATE TABLE EmployeeAudit (
    Name VARCHAR(50),
    Date DATETIME,
    Note VARCHAR(255)
);

-- 15 (contd). Create a trigger to log deletions
CREATE TRIGGER EmployeeDeleteTrigger
ON Employee
INSTEAD OF DELETE
AS
BEGIN
    DECLARE @SSN CHAR(9), @Name VARCHAR(50), @Date DATETIME, @Note VARCHAR(255);
    SELECT @SSN = SSN FROM DELETED;
    SET @Name = SYSTEM_USER;
    SET @Date = GETDATE();
    SET @Note = 'Try to delete Row with Key of row = ' + @SSN;
    INSERT INTO EmployeeAudit (Name, Date, Note) VALUES (@Name, @Date, @Note);
END;
