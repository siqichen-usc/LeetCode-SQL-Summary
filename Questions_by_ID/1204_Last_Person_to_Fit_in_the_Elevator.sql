-- Solution 1: Window Function, Subquery
SELECT TOP 1 person_name
FROM (
    SELECT person_name, turn,
        SUM(weight) OVER (ORDER BY turn) AS tw
    FROM Queue
) tb1
WHERE tw <= 1000
ORDER BY turn DESC;



-- Solution 2: Join
SELECT TOP 1 q1.person_name
FROM Queue q1
JOIN Queue q2
ON q1.turn >= q2.turn
GROUP BY q1.person_id, q1.person_name
HAVING SUM(q2.weight) <= 1000
ORDER BY SUM(q2.weight) DESC;
