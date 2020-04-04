-- Solution 1: Subquery
SELECT s.student_id, s.student_name, b.subject_name,
    (
        SELECT COUNT(*) 
        From Examinations 
        WHERE student_id = s.student_id AND subject_name = b.subject_name
    ) AS attended_exams
FROM Students s, Subjects b
ORDER BY s.student_id, b.subject_name;



-- Solution 2: Join
SELECT s.student_id, s.student_name, b.subject_name, 
    COUNT(e.student_id) AS attended_exams
FROM students s
CROSS JOIN subjects b
LEFT JOIN examinations e
ON s.student_id = e.student_id AND b.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, b.subject_name
ORDER BY s.student_id, b.subject_name;
