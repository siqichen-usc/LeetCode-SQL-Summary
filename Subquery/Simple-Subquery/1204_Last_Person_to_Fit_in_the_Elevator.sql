SELECT TOP 1 person_name
FROM (
    SELECT person_name, turn,
        SUM(weight) OVER (ORDER BY turn) AS tw
    FROM Queue
) tb1
WHERE tw <= 1000
ORDER BY turn DESC;
