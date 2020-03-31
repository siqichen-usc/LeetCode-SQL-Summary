WITH tb1 AS (
    SELECT *,
    ROW_NUMBER() OVER (PARTITION BY student_id ORDER BY grade DESC, course_id) AS r
    FROM Enrollments
)

SELECT student_id, course_id, grade
FROM tb1
WHERE r = 1
ORDER BY student_id;
