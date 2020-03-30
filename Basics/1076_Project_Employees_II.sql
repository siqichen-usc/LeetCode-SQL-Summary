SELECT TOP 1 WITH TIES project_id
FROM Project
GROUP BY project_id
ORDER BY COUNT(employee_id) DESC;
