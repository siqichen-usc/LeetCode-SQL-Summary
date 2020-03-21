SELECT AVG(salary) SecondHighestSalary
FROM (
    SELECT salary
      ,DENSE_RANK() OVER (ORDER BY salary DESC) r
    FROM employee
    ) tb1
WHERE r = 2;
