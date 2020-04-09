-- Solution: Join
SELECT s1.sub_id AS post_id, COUNT(DISTINCT s2.sub_id) AS number_of_comments
FROM Submissions s1
LEFT JOIN Submissions s2
-- Orginal posts are in left table, and comments are in right table
ON s1.sub_id = s2.parent_id
WHERE s1.parent_id IS NULL
GROUP BY s1.sub_id;
