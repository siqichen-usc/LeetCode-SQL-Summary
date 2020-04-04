WITH tb1 AS (
    SELECT l1.log_id, COUNT(*) AS r
    FROM Logs l1
    JOIN Logs l2
    ON l1.log_id >= l2.log_id
    GROUP BY l1.log_id
)

SELECT MIN(log_id) AS START_ID, MAX(log_id) AS END_ID
FROM tb1
GROUP BY log_id-r;
