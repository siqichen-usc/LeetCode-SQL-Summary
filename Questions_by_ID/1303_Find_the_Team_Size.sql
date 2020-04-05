-- Solution 1: Window Function
SELECT employee_id,
    COUNT(*) OVER (PARTITION BY team_id) AS team_size
FROM Employee;



-- Solution 2: Join
SELECT e1.employee_id, COUNT(*) AS team_size
FROM Employee e1
JOIN Employee e2 
ON e1.team_id = e2.team_id
GROUP BY e1.employee_id;
