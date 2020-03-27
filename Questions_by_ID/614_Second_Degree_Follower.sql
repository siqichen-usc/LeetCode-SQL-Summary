-- Solution 1: Subquery
SELECT followee AS follower, COUNT(DISTINCT follower) AS num
FROM follow
GROUP BY followee
HAVING followee IN (SELECT follower FROM follow)
ORDER BY followee;



-- Solution 2: Join
SELECT f1.follower, COUNT(DISTINCT f2.follower) AS num
FROM follow f1
JOIN follow f2
ON f1.follower = f2.followee
GROUP BY f1.follower
ORDER BY f1.follower;
