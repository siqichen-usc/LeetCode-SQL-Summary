-- Solution 1: Window Function, Subquery
SELECT e.id, month, 
    SUM(Salary) OVER (
        PARTITION BY id 
        ORDER BY month
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS Salary
FROM Employee e
WHERE month != (SELECT MAX(Month) FROM Employee WHERE id = e.id)
ORDER BY id, month DESC;



-- Solution: Join, Subquery
SELECT e1.id, e1.month, SUM(e2.salary) AS Salary
FROM Employee e1
JOIN Employee e2
ON e1.id = e2.id AND e1.month >= e2.month AND e1.month <= e2.month + 2
WHERE e1.month != (SELECT MAX(month) FROM Employee WHERE id = e1.id)
GROUP BY e1.id, e1.month
ORDER BY e1.id, e1.month DESC;
