SELECT TOP 1 c.Name
FROM Candidate c
JOIN Vote v
ON c.id = v.CandidateId
GROUP BY c.id, c.Name
ORDER BY COUNT(*) DESC;
