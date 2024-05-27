-- 10. Create a scalar function to check names
CREATE FUNCTION CheckNames (@SSN CHAR(9))
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @FirstName VARCHAR(50), @LastName VARCHAR(50), @Message VARCHAR(100);
    SELECT @FirstName = FirstName, @LastName = LastName FROM Employee WHERE SSN = @SSN;
    IF @FirstName IS NULL AND @LastName IS NULL
        SET @Message = 'First name & last name are null';
    ELSE IF @FirstName IS NULL
        SET @Message = 'First name is null';
    ELSE IF @LastName IS NULL
        SET @Message = 'Last name is null';
    ELSE
        SET @Message = 'First name & last name are not null';
    RETURN @Message;
END;

-- 11. Create a table-valued function to return names
CREATE FUNCTION GetEmployeeNames (@Type VARCHAR(50))
RETURNS @Names TABLE (Name VARCHAR(100))
AS
BEGIN
    IF @Type = 'first name'
        INSERT INTO @Names (Name) SELECT FirstName FROM Employee;
    ELSE IF @Type = 'last name'
        INSERT INTO @Names (Name) SELECT LastName FROM Employee;
    ELSE IF @Type = 'full name'
        INSERT INTO @Names (Name) SELECT FirstName + ' ' + LastName FROM Employee;
    RETURN;
END;
