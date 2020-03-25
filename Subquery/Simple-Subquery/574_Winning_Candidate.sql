SELECT Name
FROM Candidate
WHERE id = (
    SELECT TOP 1 CandidateId
    FROM Vote
    GROUP BY CandidateId
    ORDER BY COUNT(*) DESC
);
