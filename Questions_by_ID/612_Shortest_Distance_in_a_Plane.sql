-- Solution: Join
SELECT CAST(
    MIN(
        SQRT(
            POWER(p1.x-p2.x,2)+POWER(p1.y-p2.y,2)
        )
    )
    AS DECIMAL(10,2)
) AS shortest
FROM point_2d p1
JOIN point_2d p2
ON p1.x != p2.x OR p1.y != p2.y;
