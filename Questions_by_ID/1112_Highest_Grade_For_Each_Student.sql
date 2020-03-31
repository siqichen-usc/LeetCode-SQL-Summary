-- Solution 1: Window Function, Subquery
WITH tb1 AS (
    SELECT *,
    ROW_NUMBER() OVER (PARTITION BY student_id ORDER BY grade DESC, course_id) AS r
    FROM Enrollments
)

SELECT student_id, course_id, grade
FROM tb1
WHERE r = 1
ORDER BY student_id;



-- Solution 2: Subquery, Join
WITH tb1 AS (
    SELECT student_id, MAX(grade) AS grade
    FROM Enrollments
    GROUP BY student_id
)

SELECT e.student_id, MIN(course_id) AS course_id, e.grade
FROM Enrollments e
JOIN tb1
ON e.student_id = tb1.student_id AND e.grade = tb1.grade
GROUP BY e.student_id, e.grade
ORDER BY e.student_id;
