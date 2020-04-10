SELECT MIN(name) AS results
FROM Users
WHERE user_id IN (
    -- find users who rated greatest number of the movies
    SELECT TOP 1 WITH TIES user_id
    FROM Movie_Rating
    GROUP BY user_id
    ORDER BY COUNT(DISTINCT movie_id) DESC
)
UNION ALL 
SELECT MIN(title) AS results
FROM Movies
WHERE movie_id IN (
    -- find movies with highest average rating in Feb. 2020
    SELECT TOP 1 WITH TIES movie_id
    FROM Movie_Rating
    WHERE YEAR(created_at) = 2020 AND MONTH(created_at) = 2
    GROUP BY movie_id
    ORDER BY AVG(rating*1.0) DESC
);
