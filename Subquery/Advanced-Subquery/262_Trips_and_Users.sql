WITH t1 AS (
    SELECT request_at, 
        CASE 
            WHEN status = 'completed' then 0
            ELSE 1.0
        END AS status
    FROM trips t
    -- filter our banned client and driver and limit time frame
    WHERE client_id NOT IN (SELECT users_id FROM users WHERE banned = 'Yes')
        AND driver_id NOT IN (SELECT users_id FROM users WHERE banned = 'Yes')
        AND request_at BETWEEN '2013-10-01' AND '2013-10-03'
)

SELECT request_at AS 'Day',
    CAST(AVG(status) AS DECIMAL(4,2)) AS 'Cancellation Rate'
FROM t1
GROUP BY request_at;
