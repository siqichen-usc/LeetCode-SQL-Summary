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
