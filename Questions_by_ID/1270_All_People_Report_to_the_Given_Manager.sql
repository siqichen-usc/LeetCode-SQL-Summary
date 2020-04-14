-- Solution 1: Recursive CTE, Join
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


-- Solution 2: Subquery
With tb1 AS (
    SELECT employee_id
    FROM Employees
    WHERE manager_id = 1 AND employee_id != manager_id
),
tb2 AS (
    SELECT employee_id
    FROM Employees
    WHERE manager_id IN (SELECT * FROM tb1)
),
tb3 AS (
    SELECT employee_id
    FROM Employees
    WHERE manager_id IN (SELECT * FROM tb2)
)

SELECT *
FROM tb1
UNION
SELECT *
FROM tb2
UNION
SELECT *
FROM tb3;
