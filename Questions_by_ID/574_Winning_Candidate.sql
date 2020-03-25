-- Solution 1: Subquery
SELECT Name
FROM Candidate
WHERE id = (
    SELECT TOP 1 CandidateId
    FROM Vote
    GROUP BY CandidateId
    ORDER BY COUNT(*) DESC
);



-- Solution 2: Join
SELECT TOP 1 c.Name
FROM Candidate c
JOIN Vote v
ON c.id = v.CandidateId
GROUP BY c.id, c.Name
ORDER BY COUNT(*) DESC;



