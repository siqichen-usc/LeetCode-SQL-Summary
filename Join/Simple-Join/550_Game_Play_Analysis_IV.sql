SELECT CAST(
    COUNT(DISTINCT a.player_id)*1.0/COUNT(DISTINCT tb1.player_id)
    AS DECIMAL(10,2)
    ) AS fraction
FROM (
    SELECT player_id, event_date, 
        DENSE_RANK() OVER (PARTITION BY player_id ORDER BY event_date) AS r
    FROM activity) tb1
LEFT JOIN activity a
ON tb1.r = 1 AND tb1.player_id = a.player_id 
    AND dateadd(day,1, tb1.event_date) = a.event_date;
