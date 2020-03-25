SELECT e.id, month, 
    SUM(Salary) OVER (
        PARTITION BY id 
        ORDER BY month
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS Salary
FROM Employee e
WHERE month != (SELECT MAX(Month) FROM Employee WHERE id = e.id)
ORDER BY id, month DESC;
