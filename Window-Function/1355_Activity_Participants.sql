SELECT activity
FROM (
    SELECT activity,
        RANK() OVER (ORDER BY COUNT(*)) AS r1,
        RANK() OVER (ORDER BY COUNT(*) DESC) AS r2
    FROM Friends
    GROUP BY activity
)  tb1
WHERE r1 != 1 AND r2 != 1;
