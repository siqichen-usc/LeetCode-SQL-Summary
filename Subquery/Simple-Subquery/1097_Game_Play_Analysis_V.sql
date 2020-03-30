SELECT a1.event_date AS install_dt,
    COUNT(DISTINCT a1.player_id) AS installs,
    CAST(
        COUNT(DISTINCT a2.player_id)*1.0/COUNT(DISTINCT a1.player_id)
        AS DECIMAL(3,2)
    ) AS Day1_retention
FROM (
    SELECT player_id, MIN(event_date) AS event_date
    FROM Activity
    GROUP BY player_id
) a1
LEFT JOIN Activity a2
ON a1.player_id = a2.player_id AND DATEADD(day,1,a1.event_date) = a2.event_date
GROUP BY a1.event_date;
