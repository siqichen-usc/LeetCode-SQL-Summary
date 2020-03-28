-- Solution 1: Subquery
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



-- Solution 2: PIVOT/UNPIVOT
SELECT TOP 1 upvt.id, COUNT(*) AS num
FROM request_accepted
UNPIVOT (
    id FOR ids IN (requester_id, accepter_id)
) upvt
GROUP BY upvt.id
ORDER BY COUNT(*) DESC;
