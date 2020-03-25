SELECT class
FROM courses
GROUP BY class
HAVING COUNT(DISTINCT student) >= 5;
