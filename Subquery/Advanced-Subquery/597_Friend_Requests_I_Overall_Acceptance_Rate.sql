-- Solution 1: CASE WHEN, Subquery
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



-- Solution 2: Variable, Subquery, IIF
DECLARE @accept DECIMAL(10,2);
DECLARE @send DECIMAL(10,2);

SELECT @accept = COUNT(*) 
FROM (
    SELECT DISTINCT requester_id, accepter_id 
    FROM request_accepted
) AS tb1;

SELECT @send = IIF(COUNT(*) < 1, 1, COUNT(*)) 
FROM (
    SELECT DISTINCT sender_id, send_to_id 
    FROM friend_request
) AS tb2;

Select CAST(@accept / @send AS DECIMAL(3,2)) AS accept_rate;
