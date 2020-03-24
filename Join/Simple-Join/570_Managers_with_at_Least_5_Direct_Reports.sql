SELECT e2.name
FROM employee e1
JOIN employee e2
ON e1.managerid = e2.id
GROUP BY e2.id, e2.name
HAVING COUNT(e1.id) >= 5;
