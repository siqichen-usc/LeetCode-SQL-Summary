SELECT project_id, employee_id
FROM (
    SELECT p.project_id, p.employee_id,
        RANK() OVER (PARTITION BY project_id ORDER BY experience_years DESC) AS r
    FROM Project p
    JOIN Employee e
    ON p.employee_id = e.employee_id
) tb1
WHERE r = 1;
