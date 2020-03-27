SELECT MIN(ABS(p1.x-p2.x)) AS shortest
FROM point p1
JOIN point p2
ON p1.x != p2.x;
