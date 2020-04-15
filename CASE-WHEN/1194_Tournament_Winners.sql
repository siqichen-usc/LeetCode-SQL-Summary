-- Solution 1: Subquery, Join, CASE WEHN, Window Function
-- calculate total points scored by each user along with their group information
WITH tb1 AS (
    SELECT player_id, group_id,
        SUM(
            CASE
                WHEN player_id = first_player THEN first_score
                ELSE second_score
            END
        ) AS tp
    FROM players p
    LEFT JOIN matches m
    ON p.player_id = m.first_player OR p.player_id = m.second_player
    GROUP BY player_id, group_id
)

-- find the winner with lowest player_id in each group who scored the maximum total points within the group
SELECT group_id, player_id
FROM (
    SELECT player_id, group_id,
        ROW_NUMBER() OVER (PARTITION BY group_id ORDER BY tp DESC, player_id) AS r
    FROM tb1
) tb2
WHERE r = 1;



-- Solution 2: Subquery, Join, CASE WEHN
-- calculate total points scored by each user along with their group information
WITH tb1 AS (
    SELECT player_id, group_id,
        SUM(
            CASE
                WHEN player_id = first_player THEN first_score
                ELSE second_score
            END
        ) AS tp
    FROM players p
    LEFT JOIN matches m
    ON p.player_id = m.first_player OR p.player_id = m.second_player
    GROUP BY player_id, group_id
)

-- find the winner with lowest player_id in each group who scored the maximum total points within the group
SELECT l.group_id, l.player_id
FROM tb1 l
JOIN tb1 r
ON l.group_id = r.group_id AND 
    (l.tp < r.tp OR (l.tp = r.tp AND l.player_id >= r.player_id))
GROUP BY l.group_id, l.player_id
HAVING COUNT(*) = 1;
        SUM(
            CASE
                WHEN player_id = first_player THEN first_score
                ELSE second_score
            END
        ) AS tp
    FROM players p
    LEFT JOIN matches m
    ON p.player_id = m.first_player OR p.player_id = m.second_player
    GROUP BY player_id, group_id
)

SELECT group_id, player_id
FROM (
    SELECT player_id, group_id,
        ROW_NUMBER() OVER (PARTITION BY group_id ORDER BY tp DESC, player_id) AS r
    FROM tb1
) tb2
WHERE r = 1;
