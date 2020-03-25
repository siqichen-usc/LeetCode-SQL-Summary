SELECT TOP 1 upvt.id, COUNT(*) AS num
FROM request_accepted
UNPIVOT (
    id FOR ids IN (requester_id, accepter_id)
) upvt
GROUP BY upvt.id
ORDER BY COUNT(*) DESC;
