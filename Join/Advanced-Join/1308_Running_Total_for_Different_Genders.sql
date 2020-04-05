SELECT s1.gender, s1.day, SUM(s2.score_points) AS total
FROM Scores s1
JOIN Scores s2
ON s1.gender = s2.gender AND s1.day >= s2.day
GROUP BY s1.gender, s1.day
ORDER BY s1.gender, s1.day;
