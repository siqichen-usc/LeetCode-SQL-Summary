-- Solution 1: CASE WHEN
SELECT 
    CAST(
        CASE
            WHEN COUNT(DISTINCT CONCAT(sender_id,'_',send_to_id)) = 0 THEN 0
            ELSE 
                COUNT(DISTINCT CONCAT(requester_id,'_',accepter_id))*1.0
                /
                COUNT(DISTINCT CONCAT(sender_id,'_',send_to_id))
        END
        AS DECIMAL(3,2)
    ) AS accept_rate
 FROM request_accepted, friend_request;



-- Solution 2: CASE WHEN, Subquery
WITH send AS (
    SELECT distinct sender_id, send_to_id 
    FROM friend_request
),
accept AS (
    SELECT distinct requester_id, accepter_id 
    FROM request_accepted
)

SELECT
    CASE 
        WHEN (SELECT COUNT(*) FROM send)=0 THEN 0.0 
        ELSE 
            CAST(
                (SELECT COUNT(*) FROM accept)*1.0/(SELECT COUNT(*) FROM send)
                AS DECIMAL(3,2)
            ) 
    END AS accept_rate;
