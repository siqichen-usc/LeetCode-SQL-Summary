-- If need to extract date in other format in the future, FORMAT() function could be used

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
