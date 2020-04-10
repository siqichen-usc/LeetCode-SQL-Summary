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
