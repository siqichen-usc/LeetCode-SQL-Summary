SELECT name,
    -- 0 will be shown as distance if no record in table Rides
    COALESCE(SUM(distance),0) AS travelled_distance
FROM Users
LEFT JOIN Rides
ON Users.id = Rides.user_id
GROUP BY name
ORDER BY travelled_distance DESC, name
