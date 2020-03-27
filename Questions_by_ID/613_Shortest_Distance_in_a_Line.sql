-- Solution 1: Window Function, Subquery 
SELECT MIN(next-x) AS shortest
FROM (
    SELECT x, LEAD(x) OVER (ORDER BY x) AS next
    FROM point
) tb1;



-- Solution 2: Join
SELECT MIN(ABS(p1.x-p2.x)) AS shortest
FROM point p1
JOIN point p2
ON p1.x != p2.x;
