-- Solution 1: Window Function, Subquery
SELECT e.id, month, 
    SUM(Salary) OVER (
        PARTITION BY id 
        ORDER BY month
        -- get the cumulative sum of an employee's salary over a period of 3 months 
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS Salary
FROM Employee e
-- exclude the most recent month for each employee
WHERE month != (SELECT MAX(Month) FROM Employee WHERE id = e.id)
ORDER BY id, month DESC;



-- Solution 2: Join, Subquery
SELECT e1.id, e1.month, SUM(e2.salary) AS Salary
FROM Employee e1
JOIN Employee e2
-- data from table e2 only contained salary over a period of 3 months until e1.month
ON e1.id = e2.id AND e1.month >= e2.month AND e1.month <= e2.month + 2
-- exclude the most recent month for each employee
WHERE e1.month != (SELECT MAX(month) FROM Employee WHERE id = e1.id)
GROUP BY e1.id, e1.month
ORDER BY e1.id, e1.month DESC;
