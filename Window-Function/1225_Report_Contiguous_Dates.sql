WITH tb1 AS (
    SELECT fail_date AS date, 'failed' AS s
    FROM Failed
    UNION
    SELECT success_date AS date, 'succeeded' AS s
    FROM Succeeded
),
tb2 AS (
    SELECT *, 
        ROW_NUMBER() OVER (PARTITION BY s ORDER BY date) AS r,
        ROW_NUMBER() OVER (ORDER BY date) AS r2
    FROM tb1
    WHERE Year(date) = 2019
)

-- contiguous dates with same period state share the same r2-r,
-- so in a group with same r2-4, the smallest date is start date and the largest date is end date
SELECT s AS period_state, MIN(date) AS start_date, MAX(date) AS end_date
FROM tb2
GROUP BY r2-r, s
ORDER BY start_date;
