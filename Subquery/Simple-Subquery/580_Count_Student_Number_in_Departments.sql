SELECT DISTINCT d.dept_name,
    (SELECT COUNT(*) FROM student where dept_id = d.dept_id)  AS student_number
FROM department d
ORDER BY student_number DESC, d.dept_name;
