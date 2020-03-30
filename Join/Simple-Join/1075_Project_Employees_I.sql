SELECT p.project_id, CAST(AVG(e.experience_years*1.0) AS DECIMAL(10,2)) AS average_years
FROM Project p
LEFT JOIN Employee e
ON p.employee_id = e.employee_id
GROUP BY p.project_id;
