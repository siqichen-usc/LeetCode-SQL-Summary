CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    RETURN (
        SELECT DISTINCT salary
        FROM employee
        ORDER BY salary DESC
        OFFSET @N-1 ROW
        FETCH FIRST 1 ROW ONLY
    );
END
