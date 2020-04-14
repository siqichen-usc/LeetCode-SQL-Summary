WITH tb1 AS (
    -- numbering date with different states in chronological order separately
    SELECT f1.fail_date AS date, 'failed' AS s, COUNT(*) AS r
    FROM Failed f1
    JOIN Failed f2
    ON f1.fail_date >= f2.fail_date
    GROUP BY f1.fail_date
    UNION
    SELECT s1.success_date AS date, 'succeeded' AS s, COUNT(*) AS r
    FROM Succeeded s1
    JOIN Succeeded s2
    ON s1.success_date >= s2.success_date
    GROUP BY s1.success_date
),
tb2 AS (
    SELECT *, 
        -- numbering date in chronological order
        DATEPART(dayofyear, date) AS r2
    FROM tb1
    WHERE Year(date) = 2019
)

-- contiguous dates with same period state share the same r2-r,
-- so in a group with same r2-4, the smallest date is start date and the largest date is end date
SELECT s AS period_state, MIN(date) AS start_date, MAX(date) AS end_date
FROM tb2
GROUP BY r2-r, s
ORDER BY start_date;
