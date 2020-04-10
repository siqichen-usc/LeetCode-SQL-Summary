SELECT CAST(
    -- using DISTINCT to avoid double counting
    COUNT(DISTINCT a2.player_id)*1.0/COUNT(DISTINCT a1.player_id)
    AS DECIMAL(3,2)
) AS fraction
FROM (
    -- get the first-logged-in date of each player
    SELECT player_id, MIN(event_date) AS event_date
    FROM Activity
    GROUP BY player_id
) a1
-- if a player logged back in on the day right after the first-logged-in date, 
-- he/she would get a matched record from table a2
LEFT JOIN Activity a2
ON a1.player_id = a2.player_id AND DATEADD(day,1,a1.event_date) = a2.event_date;
