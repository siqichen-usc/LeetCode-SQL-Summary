SELECT (
    SELECT DISTINCT salary
    FROM employee
    ORDER BY salary DESC
    OFFSET 1 ROW
    FETCH NEXT 1 ROW ONLY
) AS SecondHighestSalary;
