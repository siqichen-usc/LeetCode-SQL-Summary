SELECT e.name, b.bonus
FROM Employee e
LEFT JOIN Bonus b
ON e.empId = b.empId
-- when employee has no bonus, his/her bonus will be null after left join
WHERE b.bonus IS NULL 
    OR b.bonus < 1000;
