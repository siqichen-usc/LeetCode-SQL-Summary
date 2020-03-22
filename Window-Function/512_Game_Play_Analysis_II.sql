SELECT player_id, device_id
FROM (
    SELECT player_id, device_id,
        DENSE_RANK() OVER (PARTITION BY player_id ORDER BY event_date) AS r
    FROM Activity) tb1
WHERE r = 1;
