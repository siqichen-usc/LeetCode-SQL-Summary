-- Solution 1: Subquery
SELECT name
FROM employee
WHERE id in (
    SELECT managerid 
    FROM employee 
    GROUP BY managerid 
    HAVING COUNT(*) >=5
);



-- Solution 2: Join
SELECT e2.name
FROM employee e1
JOIN employee e2
ON e1.managerid = e2.id
GROUP BY e2.id, e2.name
HAVING COUNT(e1.id) >= 5;
