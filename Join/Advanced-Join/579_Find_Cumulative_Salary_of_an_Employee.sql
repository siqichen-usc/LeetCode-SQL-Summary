SELECT e1.id, e1.month, SUM(e2.salary) AS Salary
FROM Employee e1
JOIN Employee e2
-- data from table e2 only contained salary over a period of 3 months until e1.month
ON e1.id = e2.id AND e1.month >= e2.month AND e1.month <= e2.month + 2
-- exclude the most recent month for each employee
WHERE e1.month != (SELECT MAX(month) FROM Employee WHERE id = e1.id)
GROUP BY e1.id, e1.month
ORDER BY e1.id, e1.month DESC;
