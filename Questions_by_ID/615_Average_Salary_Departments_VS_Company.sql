-- If need to extract date in other format in the future, FORMAT() function could be used

-- Solution 1: Join, Window Function, Subquery, CASE WHEN
WITH tb1 AS (
    SELECT DISTINCT department_id, LEFT(pay_date,7) AS pay_month,
        AVG(amount) OVER (PARTITION BY department_id, LEFT(pay_date,7))AS avg_dept,
        AVG(amount) OVER (PARTITION BY LEFT(pay_date,7)) AS avg_comp
    FROM salary s
    JOIN employee e
    ON s.employee_id = e.employee_id
)

SELECT pay_month, department_id,
    CASE
        WHEN avg_dept > avg_comp THEN 'higher'
        WHEN avg_dept < avg_comp THEN 'lower'
        ELSE 'same'
    END AS comparison
FROM tb1;



-- Solution 2: Join, Subquery, CASE WHEN
WITH dept AS (
    SELECT e.department_id, LEFT(s.pay_date,7) AS pay_month, AVG(s.amount) AS avg_dept
    FROM salary s
    JOIN employee e
    ON s.employee_id = e.employee_id
    GROUP BY e.department_id, LEFT(s.pay_date,7)
),
comp AS (
    SELECT LEFT(pay_date,7) AS pay_month, AVG(amount) AS avg_comp
    FROM salary
    GROUP BY LEFT(pay_date,7)
)

SELECT d.department_id, d.pay_month,
    CASE
        WHEN d.avg_dept > c.avg_comp THEN 'higher'
        WHEN d.avg_dept < c.avg_comp THEN 'lower'
        ELSE 'same'
    END AS comparison
FROM dept d
JOIN comp c
ON d.pay_month = c.pay_month;
