SELECT DISTINCT viewer_id AS id
FROM Views
GROUP BY viewer_id, view_date
-- When viewer viewed the same article more than once in the same day, using DISTINCT could avoid count that article twice
HAVING COUNT(DISTINCT article_id) > 1
ORDER BY id;
