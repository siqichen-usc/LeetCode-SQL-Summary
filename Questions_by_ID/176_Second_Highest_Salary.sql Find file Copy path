-- Solution 1: Subquery
SELECT MAX(salary) AS secondhighestsalary
FROM employee
WHERE salary < (SELECT MAX(salary) FROM employee);



-- Solution 1: Window Function
SELECT AVG(salary) SecondHighestSalary
FROM (
    SELECT salary
      ,DENSE_RANK() OVER (ORDER BY salary DESC) r
    FROM employee
    ) tb1
WHERE r = 2;



-- Solution 1: OFFSET FETCH
SELECT (
    SELECT DISTINCT salary
    FROM employee
    ORDER BY salary DESC
    OFFSET 1 ROW
    FETCH NEXT 1 ROW ONLY
) AS SecondHighestSalary;
