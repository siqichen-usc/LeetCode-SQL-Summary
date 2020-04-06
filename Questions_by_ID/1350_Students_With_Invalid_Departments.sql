-- Solution 1: Subquery
SELECT id, name
FROM Students
WHERE department_id NOT IN (SELECT id FROM Departments);



-- Solution 2: Join
SELECT s.id, s.name
FROM Students s
LEFT JOIN Departments d
ON s.department_id = d.id
WHERE d.id IS NULL;
