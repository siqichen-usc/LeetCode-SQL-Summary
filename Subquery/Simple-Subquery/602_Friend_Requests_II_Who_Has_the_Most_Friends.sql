WITH tb1 AS (
    SELECT requester_id AS id
    FROM request_accepted
    UNION ALL
    SELECT accepter_id
    FROM request_accepted
)

SELECT TOP 1 id, COUNT(*) AS num
FROM tb1
GROUP BY id
ORDER BY COUNT(*) DESC;
