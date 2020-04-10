-- Solution 1: Window Function
SELECT player_id, event_date, 
    SUM(games_played) OVER (
        PARTITION BY player_id 
        ORDER BY event_date
    )  AS games_played_so_far
FROM activity;



-- Solution 2: Join
SELECT a1.player_id, a1.event_date, SUM(a2.games_played) AS games_played_so_far
FROM activity a1
JOIN activity a2
-- the matched data from a2 include all records happened before or exactly on a1.event_date of the according record in a1
ON a1.player_id = a2.player_id AND a1.event_date >= a2. event_date
GROUP BY a1.player_id, a1.event_date;
