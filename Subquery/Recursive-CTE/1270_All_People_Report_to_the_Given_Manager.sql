-- find employees directly report to managers directly,
-- and then find people who report to managers indirectly using cte
WITH cte AS (
    SELECT employee_id
    FROM Employees
    WHERE manager_id = 1 AND employee_id != manager_id
    UNION ALL
    SELECT e.employee_id
    FROM Employees e
    JOIN cte
    ON e.manager_id = cte.employee_id
)

SELECT employee_id
FROM cte
OPTION (MAXRECURSION 3);
