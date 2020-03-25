-- Note: answer rate = answer actions / total non-answer actions
-- If LeetCode change answer for the test case, plz let me know

-- Solution: Basics
SELECT TOP 1 question_id AS survey_log
FROM survey_log
GROUP BY question_id
ORDER BY COUNT(answer_id)*1.0/(COUNT(*)-COUNT(answer_id)) DESC;
