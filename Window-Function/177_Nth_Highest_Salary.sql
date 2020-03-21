CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    RETURN (
        SELECT AVG(salary)
        FROM (
            SELECT salary, DENSE_RANK() over (ORDER BY salary DESC) r
            FROM employee
        ) tb1
        WHERE r = @N
    );
END
