-- Solution: Join, Subquery
WITH tb1 AS (
    SELECT COUNT(DISTINCT r.post_id)*100.0/COUNT(DISTINCT a.post_id) AS daily_p
    FROM Actions a
    LEFT JOIN Removals r
    ON a.post_id = r.post_id
    WHERE a.action = 'report' AND a.extra = 'spam'
    GROUP BY a.action_date
)

SELECT CAST(AVG(daily_p) AS DECIMAL(5,2)) AS average_daily_percent
FROM tb1;
