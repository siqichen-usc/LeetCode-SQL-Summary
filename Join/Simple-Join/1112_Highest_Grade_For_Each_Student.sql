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
