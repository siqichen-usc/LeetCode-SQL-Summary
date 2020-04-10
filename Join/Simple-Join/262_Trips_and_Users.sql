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
