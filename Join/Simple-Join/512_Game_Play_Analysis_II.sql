SELECT a.player_id, device_id
FROM Activity a
JOIN (
    SELECT player_id, MIN(event_date) min_date
    FROM Activity
    GROUP BY player_id
    ) tb1
ON a.player_id = tb1.player_id AND a.event_date = tb1.min_date;
