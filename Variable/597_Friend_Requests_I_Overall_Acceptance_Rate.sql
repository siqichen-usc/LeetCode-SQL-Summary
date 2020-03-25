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
