-- Solution 1: Window Function
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
*/

-- Solution 2: OFFSET FETCH
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
