SELECT s.student_id, s.student_name, b.subject_name,
    (
        SELECT COUNT(*) 
        From Examinations 
        WHERE student_id = s.student_id AND subject_name = b.subject_name
    ) AS attended_exams
FROM Students s, Subjects b
ORDER BY s.student_id, b.subject_name;
