-- Solution 1: Subquery, CASE WHEN
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



-- Solution 2: Join, CASE WHEN
SELECT t.Request_at AS 'Day', 
    CAST(
        AVG(CASE 
                WHEN status = 'completed' then 0
                ELSE 1.0
            END)
        AS DECIMAL(3,2)
    ) AS 'Cancellation Rate'
FROM Trips AS t
INNER JOIN Users c 
    ON t.Client_Id=c.Users_Id
INNER JOIN Users d 
    ON t.Driver_Id=d.Users_Id
-- filter our banned client and driver and limit time frame
WHERE c.Banned='no' AND
      d.Banned='no' AND
      t.Request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY t.Request_at;
