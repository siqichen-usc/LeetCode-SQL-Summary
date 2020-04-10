-- Solution 1: Window Function, Subquery
SELECT activity
FROM (
    SELECT activity,
        -- Numbering activity by number of participants in ascending and descending order
        RANK() OVER (ORDER BY COUNT(*)) AS r1,
        RANK() OVER (ORDER BY COUNT(*) DESC) AS r2
    FROM Friends
    GROUP BY activity
)  tb1
-- fliter out activities with minimum or maximum number of participants
WHERE r1 != 1 AND r2 != 1;



-- Solution 2: Subquery
WITH tb1 AS (
    SELECT activity, COUNT(*) AS num
    FROM Friends
    GROUP BY activity
)

SELECT activity
FROM tb1
WHERE num NOT IN (
    SELECT MAX(num) FROM tb1
    UNION ALL
    SELECT MIN(num) FROM tb1
);
