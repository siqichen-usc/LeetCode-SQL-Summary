WITH tb1 AS (
    SELECT log_id, ROW_NUMBER() OVER (ORDER BY log_id) AS r
    FROM Logs
)

SELECT MIN(log_id) AS START_ID, MAX(log_id) AS END_ID
FROM tb1
GROUP BY log_id-r;
