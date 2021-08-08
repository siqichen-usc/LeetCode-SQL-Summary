-- rank scores in each exam by both ascending and descending orders
-- if h_rank = 1 then the student has the highest score in according exam
-- if r_rank = 1 then the student has the lowest score in that exam
WITH rank_exam AS (
SELECT student_id,
    RANK() OVER (PARTITION BY exam_id ORDER BY score DESC) AS h_rank,
    RANK() OVER (PARTITION BY exam_id ORDER BY score) AS l_rank
FROM Exam
)

SELECT *
FROM Student
-- find the student who is quiet in ALL exams
WHERE student_id NOT IN (
        SELECT DISTINCT student_id 
        FROM rank_exam 
        WHERE l_rank = 1 OR h_rank = 1
    )
    -- make sure student take at least one exam
    AND student_id IN (SELECT DISTINCT student_id FROM Exam)
