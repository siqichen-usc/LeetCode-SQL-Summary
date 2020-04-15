-- Solution 1: Subquery, Join, Window Function
-- merge first and second players and their scores into two columns
WITH tb1 AS (
    SELECT first_player AS player, first_score as score
    FROM Matches
    UNION ALL
    SELECT second_player, second_score
    FROM Matches
),
-- calculate total points scored by each user along with their group information
tb2 AS (
    SELECT p.player_id, p.group_id, SUM(tb1.score) AS tp
    FROM Players p
    LEFT JOIN tb1
    ON p.player_id = tb1.player
    GROUP BY p.player_id, p.group_id
)

-- find the winner with lowest player_id in each group who scored the maximum total points within the group
SELECT group_id, player_id
FROM (
    SELECT player_id, group_id,
        ROW_NUMBER() OVER (PARTITION BY group_id ORDER BY tp DESC, player_id) AS r
    FROM tb2
) tb3
WHERE r = 1;



-- Solution 2: Subquery, Join, CASE WEHN, Window Function
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
