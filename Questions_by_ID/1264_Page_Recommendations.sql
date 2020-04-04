-- Solution: CASE WHEN, Subquery
WITH f AS (
    SELECT CASE WHEN user1_id = 1 THEN user2_id ELSE user1_id END AS fid
    FROM Friendship
    WHERE user1_id = 1 OR user2_id =1 
)

SELECT DISTINCT page_id AS recommended_page
FROM Likes
WHERE user_id IN (SELECT * FROM f)
EXCEPT
SELECT page_id
FROM Likes
WHERE user_id = 1;
