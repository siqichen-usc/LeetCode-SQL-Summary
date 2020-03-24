SELECT name
FROM employee
WHERE id in (
    SELECT managerid 
    FROM employee 
    GROUP BY managerid 
    HAVING COUNT(*) >=5
);
