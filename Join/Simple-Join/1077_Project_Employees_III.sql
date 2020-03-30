-- Solution 1: Join, Window Function, Subquery
SELECT project_id, employee_id
FROM (
    SELECT p.project_id, p.employee_id,
        RANK() OVER (PARTITION BY project_id ORDER BY experience_years DESC) AS r
    FROM Project p
    JOIN Employee e
    ON p.employee_id = e.employee_id
) tb1
WHERE r = 1;



-- Solution 2: Join, Subquery
WITH tb1 AS (
    SELECT p.project_id, p.employee_id, e.experience_years
    FROM Project p
    JOIN Employee e
    ON p.employee_id = e.employee_id
),
tb2 AS (
    SELECT project_id, MAX(experience_years) AS max_years
    FROM tb1
    GROUP BY project_id
)

SELECT project_id, employee_id
FROM tb1
WHERE experience_years = (SELECT max_years FROM tb2 WHERE project_id = tb1.project_id);
