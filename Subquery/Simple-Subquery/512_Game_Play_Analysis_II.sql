-- Solution 1: Subquery
SELECT player_id, device_id
FROM Activity
WHERE concat(player_id,event_date) IN (
    SELECT concat(player_id, MIN(event_date))
    FROM Activity
    GROUP BY player_id
);



-- Solution 2: Join, Subquery
SELECT a.player_id, device_id
FROM Activity a
JOIN (
    SELECT player_id, MIN(event_date) min_date
    FROM Activity
    GROUP BY player_id
    ) tb1
ON a.player_id = tb1.player_id AND a.event_date = tb1.min_date;



-- Solution 3: Window Function, Subquery
SELECT player_id, device_id
FROM (
    SELECT player_id, device_id,
        DENSE_RANK() OVER (PARTITION BY player_id ORDER BY event_date) AS r
    FROM Activity) tb1
WHERE r = 1;
